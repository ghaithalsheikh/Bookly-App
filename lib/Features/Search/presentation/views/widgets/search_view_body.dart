import 'package:bookly_app/Features/Search/presentaion/views/widgets/custom_search_listview.dart';
import 'package:bookly_app/Features/Search/presentaion/views/widgets/custom_search_text_feild.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      child: Column(
        children: [
          CustomSearchTextFeild(),
          SizedBox(height: 20),
          Expanded(child: CustomSearchListView())
        ],
      ),
    );
  }
}
