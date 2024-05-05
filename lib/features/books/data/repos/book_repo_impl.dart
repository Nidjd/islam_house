import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';

import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/books/data/models/books/book.dart';
import 'package:islam_house/features/books/data/models/books/datum.dart';
import 'package:islam_house/features/books/data/repos/book_repo.dart';

class BookRepoImpl implements BookRepo{
  final ApiServise _apiServise;

  BookRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getBooks({String? pageNumber}) async{
    try {
      var data = await _apiServise.getData(
          endPoint: 'books/ar/ar/$pageNumber/25/json');
      List<Datum> books = [];
      for (var item in data['data']) {
        books.add(Datum.fromJson(item));
      }
      pageNumbersForBook = Book.fromJson(data).links!.pagesNumber;

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}