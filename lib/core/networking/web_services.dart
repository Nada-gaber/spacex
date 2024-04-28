import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../features/company_info/data/model/company_info_model.dart';
import '../constant/api_constants.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  
  @GET(ApiConstants.companyInfo)
  Future<CompanyInfo> getCompanyInfo();
    @GET(ApiConstants.ships)
  Future<List<Ships>> getAllShips();
}
