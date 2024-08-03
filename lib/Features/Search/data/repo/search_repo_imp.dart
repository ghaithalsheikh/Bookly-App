import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Search/data/repo/search_repo.dart';
import 'package:bookly_app/core/errors/faliures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  int maxResultsForSearch = 20;
  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Faliure, List<BookModel>>> fetchSearchBook(
      {required String searchName}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?q=$searchName&Filtering=free-ebooks&startIndex=0&maxResults=$maxResultsForSearch');
    if (data.isNotEmpty && maxResultsForSearch < 40) {
      maxResultsForSearch = maxResultsForSearch + 10;
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
