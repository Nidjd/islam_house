import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islam_house/constants.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/datum.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/video_info.dart';
import 'package:islam_house/features/videos_section_page.dart/data/repos/video_section_repo.dart';

class VideoSectionRepoImpl implements VideoSectionRepo {
  final ApiServise _apiServise;

  VideoSectionRepoImpl(this._apiServise);
  @override
  Future<Either<Failure, List<Datum>>> getVideos({String? pageNumber}) async {
    try {
      var data = await _apiServise.getData(
          endPoint: 'videos/ar/ar/$pageNumber/25/json');
      List<Datum> videos = [];
      for (var item in data['data']) {
        videos.add(Datum.fromJson(item));
      }
      pageNumbers = VideoInfo.fromJson(data).links!.pagesNumber;
      
      return right(videos);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
