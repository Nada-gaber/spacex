import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/server_failure.dart';
import 'package:spacex/core/networking/web_services.dart';
import 'package:spacex/features/crew/data/models/crew_model.dart';

class CrewRepo {
  final WebServices _webServices;

  CrewRepo(this._webServices);

  Future<Either<Failure, List<CrewModel>>> getAllCrew() async {
    try {
      final crewModel = await _webServices.getAllCrew();
      return Right(crewModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
