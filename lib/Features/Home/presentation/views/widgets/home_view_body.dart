import 'package:bookly_app/Features/Home/presentation/view_models/fetaured_newset_books_cubit/featured_newset_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/newset_listview.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/featured_books_listview.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification) {
            BlocProvider.of<FeaturedNewsetBooksCubit>(context)
                .fetchNewsetBooks(fromLoading: true);
          }
          return true;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: CustomHomeViewAppBar()),
            const SliverToBoxAdapter(child: FeaturedBooksListView()),
            SliverToBoxAdapter(child: SizedBox(height: screenHeight * 0.04)),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Newset Book',
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<FeaturedNewsetBooksCubit,
                  FeaturedNewsetBooksState>(
                buildWhen: (previous, current) =>
                    current is! FeaturedNewsetBooksLoadingMore,
                builder: (context, state) {
                  if (state is FeaturedNewsetBooksLoading) {
                    return const CustomShimmerListView();
                  } else if (state is FeaturedNewsetBooksSuccess) {
                    return NewsetListView(
                      bookModel: state.books,
                    );
                  } else if (state is FeaturedNewsetBooksFailure) {
                    return CustomErrorWidget(errorMessage: state.erroMessage);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60,
          child:
              BlocBuilder<FeaturedNewsetBooksCubit, FeaturedNewsetBooksState>(
            buildWhen: (previous, current) =>
                current is FeaturedNewsetBooksLoadingMore ||
                current is FeaturedNewsetBooksFailure ||
                current is FeaturedNewsetBooksSuccess,
            builder: (context, state) {
              if (state is FeaturedNewsetBooksLoadingMore) {
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
