import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/article_section_page/data/repos/article_repo_impl.dart';
import 'package:islam_house/features/home/data/repos/home_repo_impl.dart';
import 'package:islam_house/features/videos_section_page.dart/data/repos/video_section_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerSingleton(ApiServise(Dio()));
  getIt.registerSingleton(HomeRepoImpl(getIt.get<ApiServise>()));
  getIt.registerSingleton(VideoSectionRepoImpl(getIt.get<ApiServise>()));
  getIt.registerSingleton(ArticleRepoImpl(getIt.get<ApiServise>()));
}
