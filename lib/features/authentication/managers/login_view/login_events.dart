part of 'login_bloc.dart';

sealed class LoginEvent {}

final class LoginSubmit extends LoginEvent {
  final String login, password;

  LoginSubmit({required this.login, required this.password});
}
