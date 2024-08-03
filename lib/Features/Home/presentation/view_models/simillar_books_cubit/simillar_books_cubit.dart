import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'simillar_books_state.dart';

class SimillarBooksCubit extends Cubit<SimillarBooksState> {
  SimillarBooksCubit(this.homeRepo) : super(SimillarBooksInitial());
  HomeRepo homeRepo;
  Future<void> fetchSimillarBooks(
      {required String category, bool fromLoading = false}) async {
    if (fromLoading) {
      emit(SimillarBooksLoadingMore());
    } else {
      emit(SimillarBooksLoading());
    }
    var result = await homeRepo.fetchSimillarBooks(category: category);
    result.fold(
      (faliure) =>
          emit(SimillarBooksFaliure(erroMessage: faliure.errorMessage)),
      (books) => emit(SimillarBooksSuccess(books: books, category: category)),
    );
  }
}
