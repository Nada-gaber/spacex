import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:spacex/core/networking/api_constants.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';

part 'web_services.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

@GET("rockets")
  Future<List<Rocket>> getAllRockets();
}