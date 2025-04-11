import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus { initial, success, error }

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({required LoginStatus status, String? errorMessage}) = _LoginState;

  factory LoginState.initial() {
    return LoginState(status: LoginStatus.initial, errorMessage: null);
  }
}
