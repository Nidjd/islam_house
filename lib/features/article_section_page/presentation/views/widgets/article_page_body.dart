import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';
import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/article_section_page/presentation/manager/cubit/get_articles_cubit.dart';
import 'package:islam_house/features/article_section_page/presentation/views/widgets/articel_item.dart';

class ArticlePageBody extends StatefulWidget {
  const ArticlePageBody({
    super.key,
  });

  @override
  State<ArticlePageBody> createState() => _ArticlePageBodyState();
}

class _ArticlePageBodyState extends State<ArticlePageBody> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetArticlesCubit, GetArticlesState>(
          builder: (context, state) {
            if (state is GetArticlesSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItem(
                    label: state.article[index].title ?? '',
                    description: state.article[index].description ?? '',
                    name: state.article[index].preparedBy!.isEmpty
                        ? ''
                        : state.article[index].preparedBy![0].title!,
                    countArticle:
                        state.article[index].attachments?.length.toString() ??
                            '',
                    onTap: () {
                      context.pushNamed(Routes.articles, context,state.article[index].attachments);
                    },
                  ),
                  itemCount: state.article.length,
                ),
              );
            } else if (state is GetArticlesFailureState) {
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
                  await BlocProvider.of<GetArticlesCubit>(context)
                      .getArticlesData(pageNumer: '1');
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
                    await BlocProvider.of<GetArticlesCubit>(context)
                        .getArticlesData(pageNumer: currentNumber.toString());
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
                  if (currentNumber < pageNumbersForArticle!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetArticlesCubit>(context)
                        .getArticlesData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbersForArticle
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetArticlesCubit>(context)
                      .getArticlesData(
                          pageNumer: pageNumbersForArticle.toString());
                  setState(() {
                    currentNumber = pageNumbersForArticle!;
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
