import 'package:dartz/dartz.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/datum.dart';

abstract class VideoSectionRepo {
  Future<Either<Failure, List<Datum>>> getVideos({String pageNumber});
}
