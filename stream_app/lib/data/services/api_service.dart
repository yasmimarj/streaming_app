import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untold/core/services/auth_service.dart';
import 'package:untold/data/models/like.dart';
import 'package:untold/data/models/movie.dart';
import 'package:untold/data/models/register_request.dart';
import 'package:untold/data/models/register_response.dart';
import 'package:untold/data/models/api_user.dart';
import 'package:untold/data/models/response_wrapper.dart';
import 'package:untold/data/services/dio_config.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://untold-strapi.api.prod.loomi.com.br/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("users")
  Future<RegisterResponse> createAccount(
    @Body() RegisterRequest body,
  );
  @POST("/auth/local/register")
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @GET("users")
  Future<List<ApiUser>> getUsers();

  @GET("likes")
  Future<ResponseWrapper<Like>> getLikes();

  @GET("movies")
  Future<ResponseWrapper<Movie>> getMovies();
}

ApiService createApiService(AuthService authService) {
  Dio dio = setupDio(authService);
  return ApiService(dio);
}
