import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(username);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('Failed to register: ${e.message}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Nova função para obter o token do usuário atual
  Future<String?> getAuthToken() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        return await user.getIdToken();
      }
      return null; // Usuário não autenticado
    } catch (e) {
      throw Exception('Erro ao obter token: $e');
    }
  }

  Future<String?> getFirebaseUID() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        return user.uid; // Retorna o UID do usuário
      }
      return null; // Nenhum usuário autenticado
    } catch (e) {
      throw Exception('Erro ao obter UID: $e');
    }
  }
}
