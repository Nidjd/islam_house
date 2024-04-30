part of 'get_videos_cubit.dart';

sealed class GetVideosState extends Equatable {
  const GetVideosState();

  @override
  List<Object> get props => [];
}

final class GetVideosInitial extends GetVideosState {}

final class GetVideosLoadingState extends GetVideosState {}

final class GetVideosFailureState extends GetVideosState {
  final Failure failure;

  const GetVideosFailureState(this.failure);
}

final class GetVideosSuccessState extends GetVideosState {
  final List<Datum> video;

  const GetVideosSuccessState(this.video);
}
