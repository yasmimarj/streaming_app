import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Obtém o usuário atual do Firebase Auth
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        print("Usuário não autenticado. Requisição sem token.");
        return super.onRequest(options, handler); // Prossegue sem token
      }

      // Recupera o token de autenticação do usuário
      String? token = await user.getIdToken();

      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
        print("Token de autenticação adicionado ao cabeçalho.");
      } else {
        print("Falha ao obter o token do usuário autenticado.");
      }
    } catch (e) {
      print("Erro ao adicionar o token de autenticação: $e");
    }

    // Prossegue com a requisição
    super.onRequest(options, handler);
  }
}
