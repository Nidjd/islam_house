import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/quran/data/models/quran/datum.dart';

abstract class QuranRepo 
{
   Future<Either<Failure, List<Datum>>> getQuran({String pageNumber});
}