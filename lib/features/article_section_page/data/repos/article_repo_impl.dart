import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/article_section_page/data/models/article/article.dart';
import 'package:islam_house/features/article_section_page/data/models/article/datum.dart';
import 'package:islam_house/features/article_section_page/data/repos/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo{
  final ApiServise _apiServise;

  ArticleRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getArticles({String? pageNumber}) async{
    try {
      var data = await _apiServise.getData(
          endPoint: 'articles/ar/ar/$pageNumber/25/json');
      List<Datum> articles = [];
      for (var item in data['data']) {
        articles.add(Datum.fromJson(item));
      }
      pageNumbersForArticle = Article.fromJson(data).links!.pagesNumber;

      return right(articles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}