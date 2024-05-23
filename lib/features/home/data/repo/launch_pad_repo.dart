import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/utils/cache_helper.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/networking/web_services.dart';

class LaunchPadRepo {
  final WebServices webServices;

  LaunchPadRepo(this.webServices);

  Future<Either<Failure, List<LaunchPad>>> getAllLaunchPads() async {
    try {
      List<LaunchPad> launchPads = await CacheHelper.getCachedLaunchPadData();
      if (launchPads.isNotEmpty) {
        return right(launchPads);
      }
      var response = await webServices.getAllLaunchPads();
      CacheHelper.cacheLaunchPadData(response);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
