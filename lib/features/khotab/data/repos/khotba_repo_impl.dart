import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';

import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/khotab/data/models/khotba/datum.dart';
import 'package:islam_house/features/khotab/data/models/khotba/khotba.dart';
import 'package:islam_house/features/khotab/data/repos/khotba_repo.dart';

class KhotbaRepoImpl implements KhotbaRepo{
  final ApiServise _apiServise;

  KhotbaRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getKhotbas({String? pageNumber}) async{
    try {
      var data = await _apiServise.getData(
          endPoint: 'khotab/ar/ar/$pageNumber/25/json');
      List<Datum> khotbas = [];
      for (var item in data['data']) {
        khotbas.add(Datum.fromJson(item));
      }
      pageNumbersForKhotab = Khotba.fromJson(data).links!.pagesNumber;

      return right(khotbas);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}