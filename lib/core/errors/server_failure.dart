import 'package:dio/dio.dart';
import 'package:spacex/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection time out with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send time out with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive time out with api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Internal Server Error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to api server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error");
      case DioExceptionType.unknown:
        return ServerFailure("No Internet Connection");

      default:
        return ServerFailure("Opps There was an error, Please Try Again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("Your request not found, please try Later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, Please Try Later");
    } else {
      return ServerFailure("Opps There was an error, Please Try Again");
    }
  }
}
