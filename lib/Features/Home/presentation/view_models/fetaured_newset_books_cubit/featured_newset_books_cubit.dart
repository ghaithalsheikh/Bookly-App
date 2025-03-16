import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';

part 'featured_newset_books_state.dart';

class FeaturedNewsetBooksCubit extends Cubit<FeaturedNewsetBooksState> {
  FeaturedNewsetBooksCubit(this.homeRepo) : super(FeaturedNewsetBooksInitial());
  HomeRepo homeRepo;

  Future<void> fetchNewsetBooks({bool fromLoading = false}) async {
    if (fromLoading) {
      emit(FeaturedNewsetBooksLoadingMore());
    } else {
      emit(FeaturedNewsetBooksLoading());
    }
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (faliure) =>
          emit(FeaturedNewsetBooksFailure(erroMessage: faliure.errorMessage)),
      (books) => emit(FeaturedNewsetBooksSuccess(books: books)),
    );
  }
}
