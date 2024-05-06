import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/features/quran/data/models/quran/datum.dart';
import 'package:islam_house/features/quran/data/repos/audio_repo.dart';

part 'get_audios_state.dart';

class GetQuranCubit extends Cubit<GetQuranState> {
  final QuranRepo _quranRepo;
  GetQuranCubit(this._quranRepo) : super(GetQuranInitial());

  Future<void> getQuranData({required String pageNumer}) async {
    emit(GetQuranLoadingState());
    var result = await _quranRepo.getQuran(pageNumber: pageNumer);
    result.fold(
      (l) {
        emit(GetQuranFailureState(l.eerMessage));
      },
      (r) {
        emit(GetQuranSuccessState(r));
      },
    );
  }
}
