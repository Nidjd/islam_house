import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/article_section_page/data/models/article/datum.dart';

abstract class ArticleRepo 
{
   Future<Either<Failure, List<Datum>>> getArticles({String pageNumber});
}