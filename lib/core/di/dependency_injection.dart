import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex/core/networking/web_services.dart';

import '../../features/home/data/repo/rocket_repo.dart';
import '../../features/home/logic/cubits/rocket_cubit/rocket_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // rocket
  getIt.registerFactory<RocketCubit>(() => RocketCubit(getIt()));
  getIt.registerLazySingleton<RocketRepo>(() => RocketRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(createAndSetUpDio()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout= const Duration(seconds: 2)
    ..options.receiveTimeout = const Duration(seconds: 3) ;

  dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    request: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
