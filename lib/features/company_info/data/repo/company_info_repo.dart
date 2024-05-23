import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/networking/web_services.dart';
import '../model/company_info_model.dart';

class CompanyRepository {
  final WebServices _webServices;

  CompanyRepository(this._webServices);
  Future<Either<Failure, CompanyInfo>> getCompanyInfo() async {
    try {
      final companyInfo = await _webServices.getCompanyInfo();
      return Right(companyInfo);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
