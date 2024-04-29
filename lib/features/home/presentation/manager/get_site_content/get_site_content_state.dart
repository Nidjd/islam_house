part of 'get_site_content_cubit.dart';

sealed class GetSiteContentState extends Equatable {
  const GetSiteContentState();

  @override
  List<Object> get props => [];
}

final class GetSiteContentInitial extends GetSiteContentState {}

final class GetSiteContentLoadingState extends GetSiteContentState {}

final class GetSiteContentFailureState extends GetSiteContentState {
  final Failure failure;

  const GetSiteContentFailureState(this.failure);
}

final class GetSiteContentSuccessState extends GetSiteContentState {
  final List<SiteContent> siteContentList;

 const GetSiteContentSuccessState(this.siteContentList);
}
