
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';

import 'package:islam_house/features/audios/data/repos/audio_repo.dart';

import '../models/audios/audios.dart';
import '../models/audios/datum.dart';

class AudioRepoImpl implements AudioRepo{
  final ApiServise _apiServise;

  AudioRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getAudios({String? pageNumber}) async{
    try {
      var data = await _apiServise.getData(
          endPoint: 'audios/ar/ar/$pageNumber/25/json');
      List<Datum> audios = [];
      for (var item in data['data']) {
        audios.add(Datum.fromJson(item));
      }
      pageNumbersForAudios = Audios.fromJson(data).links!.pagesNumber;

      return right(audios);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}