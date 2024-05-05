import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';


import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/books/presentation/manager/cubit/get_books_cubit.dart';
import 'package:islam_house/features/books/presentation/views/widgets/book_item.dart';

class BookPageBody extends StatefulWidget {
  const BookPageBody({
    super.key,
  });

  @override
  State<BookPageBody> createState() => _BookPageBodyState();
}

class _BookPageBodyState extends State<BookPageBody> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetBooksCubit, GetBooksState>(
          builder: (context, state) {
            if (state is GetBooksSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => BookItem(
                    label: state.book[index].title ?? '',
                    description: state.book[index].description ?? '',
                    name: state.book[index].preparedBy!.isEmpty
                        ? ''
                        : state.book[index].preparedBy![0].title!,
                    countBooks:
                        state.book[index].attachments?.length.toString() ??
                            '',
                    onTap: () {
                      context.pushNamed(Routes.books, context,state.book[index].attachments);
                    },
                  ),
                  itemCount: state.book.length,
                ),
              );
            } else if (state is GetBooksFailureState) {
              return CustomErrorMessage(message: state.errMessage);
            } else {
              return const Expanded(child: CustomProgreesIndicator());
            }
          },
        ),
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetBooksCubit>(context)
                      .getBooksData(pageNumer: '0');
                  setState(() {});
                  currentNumber = 1;
                },
                child: Text('first', style: Styles.font16BlueBold),
              ),
              TextButton(
                onPressed: () async {
                  if (currentNumber > 1) {
                    currentNumber--;
                    setState(() {});
                    await BlocProvider.of<GetBooksCubit>(context)
                        .getBooksData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text(
                  'prev',
                  style: Styles.font16BlueBold.copyWith(
                    color: currentNumber == 1 ? Colors.grey : Colors.blue[900],
                  ),
                ),
              ),
              // Text(
              //   'page : $currentPage',
              //   style: TextStyle(
              //       color: Colors.grey[900], fontWeight: FontWeight.bold),
              // ),
              TextButton(
                onPressed: () async {
                  if (currentNumber < pageNumbersForBook!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetBooksCubit>(context)
                        .getBooksData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbersForBook
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetBooksCubit>(context)
                      .getBooksData(
                          pageNumer: pageNumbersForBook.toString());
                  setState(() {
                    currentNumber = pageNumbersForBook!;
                  });
                },
                child: Text('last', style: Styles.font16BlueBold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
