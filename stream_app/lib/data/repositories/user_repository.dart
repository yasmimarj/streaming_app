import 'package:untold/data/models/api_user.dart';
import 'package:untold/data/services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);
  Future<List<ApiUser>> fetchAndStoreUsers() async {
    try {
      List<ApiUser> users = await apiService.getUsers();
      return users;
    } catch (e) {
      print("Erro ao buscar usuários: $e");
      return [];
    }
  }
}
