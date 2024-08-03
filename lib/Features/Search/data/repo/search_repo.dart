import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Faliure, List<BookModel>>> fetchSearchBook(
      {required String searchName});
}
