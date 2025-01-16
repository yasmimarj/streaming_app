import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stream_app/data/models/register_request.dart';
import 'package:stream_app/data/models/register_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://untold-strapi.api.stage.loomi.com.br/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("users")
  Future<RegisterResponse> createAccount(
    @Body() RegisterRequest body,
  );
}
