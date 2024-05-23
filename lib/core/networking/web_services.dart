import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:spacex/features/crew/data/models/crew_model.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';
import '../../features/company_info/data/model/company_info_model.dart';
import '../../features/ships/data/model/ships_model.dart';
import 'api_constants.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("rockets")
  Future<List<Rocket>> getAllRockets();

  @GET("launchpads")
  Future<List<LaunchPad>> getAllLaunchPads();


  @GET(ApiConstants.companyInfo)
  Future<CompanyInfo> getCompanyInfo();

  @GET(ApiConstants.ships)
  Future<List<Ships>> getAllShips();

  @GET(ApiConstants.crew)
  Future<List<CrewModel>> getAllCrew();
}
