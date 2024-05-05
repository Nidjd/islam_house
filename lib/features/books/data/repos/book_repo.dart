import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/books/data/models/books/datum.dart';

abstract class BookRepo 
{
   Future<Either<Failure, List<Datum>>> getBooks({String pageNumber});
}