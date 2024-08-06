import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';

class NewsetListView extends StatelessWidget {
  const NewsetListView({super.key, required this.bookModel});
  final List<BookModel> bookModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookModel.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BookListViewItem(bookModel: bookModel[index]),
        );
      },
    );
  }
}
