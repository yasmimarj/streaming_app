import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createAccount(
    String email, String password, String username) async {
  const String apiUrl =
      'https://untold-strapi.api.stage.loomi.com.br/auth/local/register';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(
          'Erro: ${responseData['message'] ?? 'Erro desconhecido'}');
    }
  } catch (error) {
    throw Exception('Erro ao conectar à API: $error');
  }
}
