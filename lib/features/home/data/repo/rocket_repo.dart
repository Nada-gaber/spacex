import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/server_failure.dart';
import 'package:spacex/core/networking/web_services.dart';

import '../models/rocket_model.dart';

class RocketRepo {
  final WebServices webServices;

  RocketRepo(this.webServices);

  Future<Either<Failure, List<Rocket>>> getAllRockets() async {

    try {
      var response = await webServices.getAllRockets();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
