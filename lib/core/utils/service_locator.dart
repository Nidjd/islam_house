
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islam_house/core/utils/api_service.dart';
import 'package:islam_house/features/home/data/repos/home_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerSingleton(ApiServise(Dio()));
  getIt.registerSingleton(HomeRepoImpl(getIt.get<ApiServise>()));
}
