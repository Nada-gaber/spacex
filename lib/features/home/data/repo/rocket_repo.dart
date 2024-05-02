import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/server_failure.dart';
import 'package:spacex/core/networking/web_services.dart';
import 'package:spacex/core/utils/cache_helper.dart';

import '../models/rocket_model.dart';

class RocketRepo {
  final WebServices webServices;

  RocketRepo(this.webServices);

  Future<Either<Failure, List<Rocket>>> getAllRockets() async {
    try {
      List<Rocket> rockets = await CacheHelper.getCachedRocketsData();
      if (rockets.isNotEmpty) {
        return right(rockets);
      }
      final response = await webServices.getAllRockets();
      CacheHelper.cacheRocketsData(response);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
