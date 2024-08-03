import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/faliures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  int maxResultForNewsetBooks = 20;
  int maxResultForFeaturedBooks = 10;
  int maxResultForSimillarBooks = 10;
  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Faliure, List<BookModel>>> fetchNewsetBooks() async {
    var data = await apiService.get(
        endpoint:
            'volumes?q=subject:programming&Filtering=free-ebooks&sorting=newset&startIndex=0&maxResults=$maxResultForNewsetBooks');
    if (data.isNotEmpty && maxResultForNewsetBooks < 40) {
      maxResultForNewsetBooks = maxResultForNewsetBooks + 10;
    }
    try {
      List<BookModel> listBooks = [];
      for (var item in data['items']) {
        listBooks.add(BookModel.fromJson(item));
      }
      return right(listBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint:
            'volumes?q=programming&Filtering=free-ebooks&startIndex=0&maxResults=$maxResultForFeaturedBooks');

    if (data.isNotEmpty && maxResultForFeaturedBooks < 40) {
      maxResultForFeaturedBooks = maxResultForFeaturedBooks + 10;
    }
    try {
      List<BookModel> listBooks = [];
      for (var item in data['items']) {
        listBooks.add(BookModel.fromJson(item));
      }
      return right(listBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchSimillarBooks(
      {required String category}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?q=$category&Filtering=free-ebooks&Sorting=relevance&startIndex=0&maxResults=$maxResultForSimillarBooks');
    if (data.isNotEmpty && maxResultForSimillarBooks < 40) {
      maxResultForSimillarBooks = maxResultForSimillarBooks + 10;
    }
    try {
      List<BookModel> listBooks = [];
      for (var item in data['items']) {
        listBooks.add(BookModel.fromJson(item));
      }
      return right(listBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
