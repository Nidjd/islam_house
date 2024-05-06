import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/features/audios/data/models/audios/datum.dart';
import 'package:islam_house/features/audios/data/repos/audio_repo.dart';

part 'get_audios_state.dart';

class GetAudioCubit extends Cubit<GetAudiosState> {
  final AudioRepo _audioRepo;
  GetAudioCubit(this._audioRepo) : super(GetAudiosInitial());

  Future<void> getAudiosData({required String pageNumer}) async {
    emit(GetAudiosLoadingState());
    var result = await _audioRepo.getAudios(pageNumber: pageNumer);
    result.fold(
      (l) {
        emit(GetAudiosFailureState(l.eerMessage));
      },
      (r) {
        emit(GetAudiosSuccessState(r));
      },
    );
  }
}
