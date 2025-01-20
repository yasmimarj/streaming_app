import 'package:dio/dio.dart';
import 'package:untold/core/services/auth_service.dart';

class AuthInterceptor extends Interceptor {
  final AuthService _authService;

  AuthInterceptor(this._authService);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String? token = await _authService.getAuthToken();
      String? uid = await _authService.getFirebaseUID();
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
        print("UID do usuário: $uid");
        print("TOKEN do usuário: $token");
      }
    } catch (e) {
      print("Erro ao adicionar o token de autenticação: $e");
    }

    super.onRequest(options, handler);
  }
}

Dio setupDio(AuthService authService) {
  final dio = Dio();

  dio.interceptors.add(AuthInterceptor(authService));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      print("Fazendo requisição para: ${options.uri}");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print("Resposta recebida. Status Code: ${response.statusCode}");
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      print("Erro na requisição. Status Code: ${e.response?.statusCode}");
      return handler.next(e);
    },
  ));

  return dio;
}
