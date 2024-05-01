import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex/core/networking/web_services.dart';
import 'package:spacex/features/crew/data/repo/crew_repo.dart';
import 'package:spacex/features/crew/logic/get_all_crew/get_all_crew_cubit.dart';
import 'package:spacex/features/edit_profile/data/profile_repo.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
import 'package:spacex/features/home/data/repo/home_repo.dart';
import 'package:spacex/features/home/data/repo/launch_pad_repo.dart';
import 'package:spacex/features/home/data/repo/rocket_repo.dart';
import 'package:spacex/features/home/logic/cubits/launch_pads_cubit/launch_pads_cubit.dart';
import 'package:spacex/features/home/logic/cubits/rocket_cubit/rocket_cubit.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';
import 'package:spacex/features/home/logic/logout/logout_cubit.dart';
import 'package:spacex/features/login/data/repo/login_repo.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';
import 'package:spacex/features/register/data/repo/register_repo.dart';
import 'package:spacex/features/register/logic/create_user/create_user_cubit.dart';
import 'package:spacex/features/register/logic/register/register_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // web services
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetUpDio()));

  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt(),
      getIt(),
    ),
  );

  // profile
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory<EditProfileDataCubit>(
    () => EditProfileDataCubit(
      getIt(),
    ),
  );
  getIt.registerFactory<GetProfileDataCubit>(
    () => GetProfileDataCubit(
      getIt(),
    ),
  );
  getIt.registerFactory<UploadProfileImageCubit>(
    () => UploadProfileImageCubit(
      getIt(),
    ),
  );

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // logout
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));

  // rocket
  getIt.registerFactory<RocketCubit>(() => RocketCubit(getIt()));
  getIt.registerLazySingleton<RocketRepo>(() => RocketRepo(getIt()));

  //launch pads
  getIt.registerFactory<LaunchPadsCubit>(() => LaunchPadsCubit(getIt()));
  getIt.registerLazySingleton<LaunchPadRepo>(() => LaunchPadRepo(getIt()));


  // create user
  getIt.registerFactory<CreateUserCubit>(
        () => CreateUserCubit(
      getIt(),
    ),
  );

  // crew
  getIt.registerFactory<GetAllCrewCubit>(
    () => GetAllCrewCubit(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<CrewRepo>(
    () => CrewRepo(
      getIt(),
    ),
  );
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);

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
