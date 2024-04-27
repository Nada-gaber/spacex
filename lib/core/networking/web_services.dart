import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/ships/ui/data/model/ships_model.dart';
import '../constant/api_constants.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('/ships')
  Future<List<Ships>> getAllShips();
}
