import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/features/article_section_page/data/models/article/datum.dart';
import 'package:islam_house/features/article_section_page/data/repos/article_repo.dart';

part 'get_articles_state.dart';

class GetArticlesCubit extends Cubit<GetArticlesState> {
  final ArticleRepo _articleRepo;
  GetArticlesCubit(this._articleRepo) : super(GetArticlesInitial());

  Future<void> getArticlesData({required String pageNumer}) async {
    emit(GetArticlesLoadingState());
    var result = await _articleRepo.getArticles(pageNumber: pageNumer);
    result.fold(
      (l) {
        emit(GetArticlesFailureState(l.eerMessage));
      },
      (r) {
        emit(GetArticlesSuccessState(r));
      },
    );
  }
}
