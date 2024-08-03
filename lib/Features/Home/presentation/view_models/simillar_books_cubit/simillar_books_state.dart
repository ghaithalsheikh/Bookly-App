part of 'simillar_books_cubit.dart';

sealed class SimillarBooksState extends Equatable {
  const SimillarBooksState();

  @override
  List<Object> get props => [];
}

final class SimillarBooksInitial extends SimillarBooksState {}

final class SimillarBooksLoading extends SimillarBooksState {}

final class SimillarBooksLoadingMore extends SimillarBooksState {}

final class SimillarBooksFaliure extends SimillarBooksState {
  final String erroMessage;

  const SimillarBooksFaliure({required this.erroMessage});
}

final class SimillarBooksSuccess extends SimillarBooksState {
  final List<BookModel> books;
  final String category;

  const SimillarBooksSuccess({required this.category, required this.books});
}
