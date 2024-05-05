part of 'get_books_cubit.dart';

sealed class GetBooksState extends Equatable {
  const GetBooksState();

  @override
  List<Object> get props => [];
}

final class GetBooksInitial extends GetBooksState {}

final class GetBooksLoadingState extends GetBooksState {}

final class GetBooksFailureState extends GetBooksState {
  final String errMessage;

  const GetBooksFailureState(this.errMessage);
}

final class GetBooksSuccessState extends GetBooksState {
  final List<Datum> book;

  const GetBooksSuccessState(this.book);
}
