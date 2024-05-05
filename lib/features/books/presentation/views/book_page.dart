import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/books/data/repos/book_repo_impl.dart';
import 'package:islam_house/features/books/presentation/manager/cubit/get_books_cubit.dart';

import 'package:islam_house/features/books/presentation/views/widgets/book_page_body.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetBooksCubit(getIt.get<BookRepoImpl>())..getBooksData(pageNumer: '0'),
        child: const BookPageBody(),
      ),
    );
  }
}
