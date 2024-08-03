import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks({bool fromLoadingPagintaon = false}) async {
    if (fromLoadingPagintaon) {
      emit(FeaturedBooksLoadingMore());
    } else {
      emit(FeaturedBooksLoading());
    }
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (faliure) =>
          emit(FeaturedBooksFaliure(erroMessage: faliure.errorMessage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
