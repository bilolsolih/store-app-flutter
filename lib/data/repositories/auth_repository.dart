import 'package:store_app/core/client.dart';
import 'package:store_app/core/secure_storage.dart';
import 'package:store_app/data/models/login_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<String?> login(LoginModel data) async {
    final rawToken = await client.genericPostRequest('/auth/login', data: data);
    return rawToken['accessToken'];
  }

  Future<String?> refreshToken() async {
    final userLogin = await SecureStorage.getLogin();
    final userPassword = await SecureStorage.getPassword();

    if (userLogin == null || userPassword == null) {
      return null;
    }
    
    return await login(LoginModel(login: userLogin, password: userPassword));
  }
}
