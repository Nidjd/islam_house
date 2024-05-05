import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/features/khotab/data/models/khotba/datum.dart';
import 'package:islam_house/features/khotab/data/repos/khotba_repo.dart';

part 'get_khotab_state.dart';

class GetKhotabCubit extends Cubit<GetKhotabState> {
  final KhotbaRepo _khotabRepo;
  GetKhotabCubit(this._khotabRepo) : super(GetKhotabInitial());

  Future<void> getKhotabData({required String pageNumer}) async {
    emit(GetKhotabLoadingState());
    var result = await _khotabRepo.getKhotbas(pageNumber: pageNumer);
    result.fold(
      (l) {
        emit(GetKhotabFailureState(l.eerMessage));
      },
      (r) {
        emit(GetKhotabSuccessState(r));
      },
    );
  }
}
