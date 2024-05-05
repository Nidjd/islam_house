import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/article_section_page/data/repos/article_repo_impl.dart';
import 'package:islam_house/features/article_section_page/presentation/manager/cubit/get_articles_cubit.dart';

import 'package:islam_house/features/article_section_page/presentation/views/widgets/article_page_body.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetArticlesCubit(getIt.get<ArticleRepoImpl>())..getArticlesData(pageNumer: '0'),
        child: const ArticlePageBody(),
      ),
    );
  }
}
