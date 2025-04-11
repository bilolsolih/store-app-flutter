import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/models/login_model.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/authentication/managers/login_view/login_state.dart';

part 'login_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepo})
    : _authRepo = authRepo,
      super(LoginState.initial()) {
    on<LoginSubmit>(_onSubmit);
  }

  final AuthRepository _authRepo;

  Future<void> _onSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    final data = LoginModel(login: event.login, password: event.password);
    final result = await _authRepo.login(data);

  }
}
