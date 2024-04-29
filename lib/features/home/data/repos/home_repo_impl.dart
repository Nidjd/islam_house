import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/home/data/models/site_content/site_content.dart';
import 'package:islam_house/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServise _apiServise;

  HomeRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<SiteContent>>> getSiteContent() async {
    try {
      var data = await _apiServise.getData(endPoint: 'sitecontent/ar/ar/json');

      List<SiteContent> siteContent = [];

      for (var item in data) {
        siteContent.add(SiteContent.fromJson(item));
      }

      return right(siteContent);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
