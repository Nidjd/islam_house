
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';

import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/quran/data/models/quran/quran.dart';
import 'package:islam_house/features/quran/data/repos/audio_repo.dart';



import '../models/quran/datum.dart';

class QuranRepoImpl implements QuranRepo{
  final ApiServise _apiServise;

  QuranRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getQuran({String? pageNumber}) async{
    try {
      var data = await _apiServise.getData(
          endPoint: 'quran/ar/ar/$pageNumber/25/json');
      List<Datum> quran = [];
      for (var item in data['data']) {
        quran.add(Datum.fromJson(item));
      }
      pageNumbersForQuran = Quran.fromJson(data).links!.pagesNumber;

      return right(quran);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}