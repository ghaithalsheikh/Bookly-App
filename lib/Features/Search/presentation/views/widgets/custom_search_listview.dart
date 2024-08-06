import 'package:bookly_app/Features/Home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_listview.dart';
import 'package:bookly_app/Features/Search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBooksCubit, SearchBooksState>(
        buildWhen: (previous, current) => current is! SearchBooksLoadingMore,
        builder: (context, state) {
          if (state is SearchBooksSuccess) {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  BlocProvider.of<SearchBooksCubit>(context).fetchSearchBook(
                      searchName: state.searchName, fromLoadingPagintaon: true);
                }
                return true;
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.bookModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: BookListViewItem(
                      bookModel: state.bookModel[index],
                    ),
                  );
                },
              ),
            );
          } else if (state is SearchBooksFaliure) {
            return CustomErrorWidget(errorMessage: state.errorMesaage);
          } else if (state is SearchBooksLoading) {
            return const CustomShimmerListView();
          } else {
            return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60,
          child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
            buildWhen: (previous, current) =>
                current is SearchBooksLoadingMore ||
                current is SearchBooksSuccess,
            builder: (context, state) {
              if (state is SearchBooksLoadingMore) {
                return const CustomLoadingIndicator();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
