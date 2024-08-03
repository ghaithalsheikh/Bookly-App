import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  SearchRepo searchRepo;

  Future<void> fetchSearchBook(
      {required String searchName, bool fromLoadingPagintaon = false}) async {
    if (fromLoadingPagintaon) {
      emit(SearchBooksLoadingMore());
    } else {
      emit(SearchBooksLoading());
    }
    var results = await searchRepo.fetchSearchBook(searchName: searchName);
    results.fold(
      (faliure) => emit(SearchBooksFaliure(errorMesaage: faliure.errorMessage)),
      (books) =>
          emit(SearchBooksSuccess(bookModel: books, searchName: searchName)),
    );
  }
}
