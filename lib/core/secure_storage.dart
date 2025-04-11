import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static final String _passwordKey = "password";
  static final String _loginKey = "login";
  static final String _jwtTokenKey = "jwt";

  static Future<String?> getJwtToken() async {
    return await _storage.read(key: _jwtTokenKey);
  }

  static Future setJwtToken(String value) async {
    await _storage.write(key: _jwtTokenKey, value: value);
  }

  static Future<String?> getLogin() async {
    return await _storage.read(key: _loginKey);
  }

  static Future setLogin(String value) async {
    await _storage.write(key: _loginKey, value: value);
  }

  static Future<String?> getPassword() async {
    return await _storage.read(key: _passwordKey);
  }

  static Future setPassword(String value) async {
    await _storage.write(key: _passwordKey, value: value);
  }

  static Future deleteCredentials() async {
    await _storage.delete(key: _jwtTokenKey);
    await _storage.delete(key: _loginKey);
    await _storage.delete(key: _passwordKey);
  }
}
