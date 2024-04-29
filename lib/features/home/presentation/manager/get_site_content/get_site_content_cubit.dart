import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/core/errors/failures.dart';
import 'package:islam_house/features/home/data/models/site_content/site_content.dart';
import 'package:islam_house/features/home/data/repos/home_repo.dart';

part 'get_site_content_state.dart';

class GetSiteContentCubit extends Cubit<GetSiteContentState> {
  final HomeRepo _homeRepo;
  GetSiteContentCubit(this._homeRepo) : super(GetSiteContentInitial());

  Future<void> getSiteContent() async {
    emit(GetSiteContentLoadingState());
    var result = await _homeRepo.getSiteContent();
    result.fold((Failure fail) {
      emit(GetSiteContentFailureState(fail));
    }, (List<SiteContent> sitecontentList) {
      emit(GetSiteContentSuccessState(sitecontentList));
    });
  }
}
