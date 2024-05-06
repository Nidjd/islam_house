part of 'get_audios_cubit.dart';

sealed class GetAudiosState extends Equatable {
  const GetAudiosState();

  @override
  List<Object> get props => [];
}

final class GetAudiosInitial extends GetAudiosState {}

final class GetAudiosLoadingState extends GetAudiosState {}

final class GetAudiosFailureState extends GetAudiosState {
  final String errMessage;

  const GetAudiosFailureState(this.errMessage);
}

final class GetAudiosSuccessState extends GetAudiosState {
  final List<Datum> audios;

  const GetAudiosSuccessState(this.audios);
}
