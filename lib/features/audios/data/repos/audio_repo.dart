import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/audios/data/models/audios/datum.dart';

abstract class AudioRepo 
{
   Future<Either<Failure, List<Datum>>> getAudios({String pageNumber});
}