import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/khotab/data/models/khotba/datum.dart';

abstract class KhotbaRepo 
{
   Future<Either<Failure, List<Datum>>> getKhotbas({String pageNumber});
}