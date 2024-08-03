part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> bookModel;
  final String searchName;

  const SearchBooksSuccess({required this.bookModel, required this.searchName});
}

final class SearchBooksFaliure extends SearchBooksState {
  final String errorMesaage;

  const SearchBooksFaliure({required this.errorMesaage});
}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksLoadingMore extends SearchBooksState {}
