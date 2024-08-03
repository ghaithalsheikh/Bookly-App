import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Features/Home/presnetaion/view_models/simillar_books_cubit/simillar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/book_details_view.dart';
import 'package:bookly_app/Features/Home/presnetaion/views/home_view.dart';
import 'package:bookly_app/Features/Search/data/repo/search_repo_imp.dart';
import 'package:bookly_app/Features/Search/presentaion/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/Features/Search/presentaion/views/search_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/core/widgets/custom_animated_nav_right_to_left.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return customTransitionPage(context, state, const SplashView());
        },
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return customTransitionPage(context, state, const HomeView());
        },
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) {
          return customTransitionPage(
            context,
            state,
            BlocProvider(
              create: (context) => SearchBooksCubit(getIt.get<SearchRepoImp>()),
              child: const SearchView(),
            ),
          );
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        pageBuilder: (context, state) {
          final bookModel = state.extra as BookModel;
          return customTransitionPage(
            context,
            state,
            BlocProvider(
              create: (context) => SimillarBooksCubit(getIt.get<HomeRepoImp>()),
              child: BookDetailsView(bookModel: bookModel),
            ),
          );
        },
      ),
    ],
  );
}
