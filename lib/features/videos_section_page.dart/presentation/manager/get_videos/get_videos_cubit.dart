import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/datum.dart';
import 'package:islam_house/features/videos_section_page.dart/data/repos/video_section_repo.dart';

part 'get_videos_state.dart';

class GetVideosCubit extends Cubit<GetVideosState> {
  final VideoSectionRepo _videoSectionRepo;
  GetVideosCubit(this._videoSectionRepo) : super(GetVideosInitial());

  Future<void> getVideosData({required String pageNumber}) async {
    emit(GetVideosLoadingState());
    var result = await _videoSectionRepo.getVideos(pageNumber: pageNumber);

    result.fold((Failure fail) {
      emit(GetVideosFailureState(fail));
    }, (dynamic video) {
      emit(GetVideosSuccessState(video));
    });
  }
}
