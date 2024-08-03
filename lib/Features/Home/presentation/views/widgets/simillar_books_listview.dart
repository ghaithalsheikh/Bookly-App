import 'package:bookly_app/Features/Home/presnetaion/view_models/simillar_books_cubit/simillar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/custom_book_image.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/widgets/custom_shimmer_simillar.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimillarBooksListView extends StatelessWidget {
  const SimillarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<SimillarBooksCubit, SimillarBooksState>(
            buildWhen: (previous, current) =>
                current is! SimillarBooksLoadingMore,
            builder: (context, state) {
              if (state is SimillarBooksSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .19,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        BlocProvider.of<SimillarBooksCubit>(context)
                            .fetchSimillarBooks(
                                category: state.category, fromLoading: true);
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: state.books.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
              } else if (state is SimillarBooksFaliure) {
                return CustomErrorWidget(errorMessage: state.erroMessage);
              } else {
                return const CustomSshimmerSimillar();
              }
            },
          ),
        ),
        BlocBuilder<SimillarBooksCubit, SimillarBooksState>(
          builder: (context, state) {
            if (state is SimillarBooksLoadingMore) {
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
