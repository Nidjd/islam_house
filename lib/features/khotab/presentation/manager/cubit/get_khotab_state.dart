part of 'get_khotab_cubit.dart';

sealed class GetKhotabState extends Equatable {
  const GetKhotabState();

  @override
  List<Object> get props => [];
}

final class GetKhotabInitial extends GetKhotabState {}

final class GetKhotabLoadingState extends GetKhotabState {}

final class GetKhotabFailureState extends GetKhotabState {
  final String errMessage;

  const GetKhotabFailureState(this.errMessage);
}

final class GetKhotabSuccessState extends GetKhotabState {
  final List<Datum> khotab;

  const GetKhotabSuccessState(this.khotab);
}
