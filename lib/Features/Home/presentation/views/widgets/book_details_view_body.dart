import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/books_details_section.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/simillar_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetailsAppbar(),
              BooksDetailsSection(
                bookModel: bookModel,
              ),
              const Expanded(child: SizedBox(height: 40)),
              const SimllarSection(),
            ],
          ),
        )
      ],
    );
  }
}
