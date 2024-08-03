part of 'featured_newset_books_cubit.dart';

sealed class FeaturedNewsetBooksState extends Equatable {
  const FeaturedNewsetBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedNewsetBooksInitial extends FeaturedNewsetBooksState {}

final class FeaturedNewsetBooksLoading extends FeaturedNewsetBooksState {}

final class FeaturedNewsetBooksLoadingMore extends FeaturedNewsetBooksState {}

final class FeaturedNewsetBooksSuccess extends FeaturedNewsetBooksState {
  final List<BookModel> books;

  const FeaturedNewsetBooksSuccess({required this.books});
}

final class FeaturedNewsetBooksFailure extends FeaturedNewsetBooksState {
  final String erroMessage;

  const FeaturedNewsetBooksFailure({required this.erroMessage});
}
