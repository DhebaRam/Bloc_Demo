import 'package:bloc_demo/login_auth/repository/auth_repository.dart';
import 'package:bloc_demo/utils/api_manager/api_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/login_model.dart';
part 'login_auth_event.dart';
part 'login_auth_state.dart';

class AuthBloc extends Bloc<LoginAuthEvent, AuthState> {
  final AuthRepository authRepository; // = AuthRepository();

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginAuthCreate>(_checkCredential);
    on<CheckBoxUpdate>(_changeCheckBoX);
  }

  Future<void> _checkCredential(
      LoginAuthCreate loginAuthCreate, Emitter<AuthState> emit) async {
    emit(AuthLoader());
    final emailValid = (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(loginAuthCreate.emailId));
    if (!emailValid) {
      return emit(AuthFailed(error: 'Please enter valid emil'));
    }

    if (loginAuthCreate.password.length < 6) {
      return emit(
        AuthFailed(error: 'Password cannot be less than 6 characters!'),
      );
    }

    if (loginAuthCreate.password.length < 6) {
      return emit(
        AuthFailed(error: 'Password cannot be less than 6 characters!'),
      );
    }
    try {
      var map = <String, dynamic>{};
      map['email'] = loginAuthCreate.emailId;
      map['password'] = loginAuthCreate.password;
      UserData? userData =
          await authRepository.checkAuthCredential(map, Method.post);
      emit(AuthSuccess(userData: userData));
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  Future<void> _changeCheckBoX(
      CheckBoxUpdate boxValue, Emitter<AuthState> emit) async {
    print('Model in Check Box Value ---- > ${boxValue.checkBoxValue}');
    final value = boxValue.checkBoxValue;
    emit(CheckBoxValue(checkValue: value));
  }
}
