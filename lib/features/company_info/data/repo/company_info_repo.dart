import 'package:dio/dio.dart';
import '../../../../core/networking/web_services.dart';
import '../model/company_info_model.dart';

class CompanyRepository {
  final WebServices _webServices;

  CompanyRepository(this._webServices);

  Future<CompanyInfo> getCompanyInfo() async {
    try {
      final response = await _webServices.getCompanyInfo();
      return response;
    } on DioError catch (error) {
      print("Error: ${error.message}");
      throw Exception("Failed to get company information");
    }
  }
}
