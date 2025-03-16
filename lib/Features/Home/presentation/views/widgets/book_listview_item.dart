import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => GoRouter.of(context)
          .push(AppRouter.kBookDetailsView, extra: bookModel),
      child: SizedBox(
        height: screenHeight * 0.18,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            SizedBox(width: screenWidth * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title ?? '',
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  Text(
                    (bookModel.volumeInfo.authors?[0]) ?? '',
                    style: Styles.textStyle14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRating(
                        bookModel: bookModel,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
