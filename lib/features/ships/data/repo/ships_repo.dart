import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/errors/server_failure.dart';
import 'package:spacex/core/networking/web_services.dart';
import '../../../../core/errors/failure.dart';
import '../model/ships_model.dart';

class ShipsRepository {
  final WebServices _webServices;

  ShipsRepository(this._webServices);

  Future<Either<Failure, List<Ships>>> getShips() async {
    try {
      final shipsModel = await _webServices.getAllShips();
      return Right(shipsModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
