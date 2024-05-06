part of 'get_audios_cubit.dart';

sealed class GetQuranState extends Equatable {
  const GetQuranState();

  @override
  List<Object> get props => [];
}

final class GetQuranInitial extends GetQuranState {}

final class GetQuranLoadingState extends GetQuranState {}

final class GetQuranFailureState extends GetQuranState {
  final String errMessage;

  const GetQuranFailureState(this.errMessage);
}

final class GetQuranSuccessState extends GetQuranState {
  final List<Datum> quran;

  const GetQuranSuccessState(this.quran);
}
