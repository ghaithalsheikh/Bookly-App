import 'package:bookly_app/Features/Home/presnetaion/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/custom_book_image.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/custom_shimmer_book.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
            buildWhen: (previous, current) =>
                current is! FeaturedBooksLoadingMore,
            builder: (context, state) {
              if (state is FeaturedBooksSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .22,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        BlocProvider.of<FeaturedBooksCubit>(context)
                            .fetchFeaturedBooks(fromLoadingPagintaon: true);
                      }
                      return true;
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.books.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                  AppRouter.kBookDetailsView,
                                  extra: state.books[index]);
                            },
                            child: CustomBookImage(
                                imageUrl: state.books[index].volumeInfo
                                        .imageLinks?.thumbnail ??
                                    ''),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is FeaturedBooksFaliure) {
                return CustomErrorWidget(errorMessage: state.erroMessage);
              } else if (state is FeaturedBooksLoading) {
                return const CustomShimmerBook();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          builder: (context, state) {
            if (state is FeaturedBooksLoadingMore) {
              return const Padding(
                padding: EdgeInsets.only(left: 10),
                child: CustomLoadingIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
