// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.24),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 20),
        Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo.title!,
            style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold, fontFamily: kGtSectraFine)),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(bookModel.volumeInfo.authors![0],
              style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
        ),
        BookRating(
          bookModel: bookModel,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Container(
          margin:const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
              bookModel.volumeInfo.description!,
            ),
          ),
        ),
        BooksActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
