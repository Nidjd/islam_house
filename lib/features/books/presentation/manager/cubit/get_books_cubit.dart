import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islam_house/features/books/data/models/books/datum.dart';
import 'package:islam_house/features/books/data/repos/book_repo.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  final BookRepo _bookRepo;
  GetBooksCubit(this._bookRepo) : super(GetBooksInitial());

  Future<void> getBooksData({required String pageNumer}) async {
    emit(GetBooksLoadingState());
    var result = await _bookRepo.getBooks(pageNumber: pageNumer);
    result.fold(
      (l) {
        emit(GetBooksFailureState(l.eerMessage));
      },
      (r) {
        emit(GetBooksSuccessState(r));
      },
    );
  }
}
