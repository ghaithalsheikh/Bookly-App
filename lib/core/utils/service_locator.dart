import 'package:bookly_app/Features/Home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Features/Search/data/repo/search_repo_imp.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
