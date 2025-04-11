import 'package:store_app/data/interfaces/serializable.dart';

class LoginModel implements IJsonSerializable {
  final String login, password;

  LoginModel({required this.login, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return {"login": login, "password": password};
  }
}
