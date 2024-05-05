part of 'get_articles_cubit.dart';

sealed class GetArticlesState extends Equatable {
  const GetArticlesState();

  @override
  List<Object> get props => [];
}

final class GetArticlesInitial extends GetArticlesState {}

final class GetArticlesLoadingState extends GetArticlesState {}

final class GetArticlesFailureState extends GetArticlesState {
  final String errMessage;

  const GetArticlesFailureState(this.errMessage);
}

final class GetArticlesSuccessState extends GetArticlesState {
  final List<Datum> article;

  const GetArticlesSuccessState(this.article);
}
