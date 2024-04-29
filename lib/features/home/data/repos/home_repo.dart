import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/home/data/models/site_content/site_content.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<SiteContent> >> getSiteContent();
}
