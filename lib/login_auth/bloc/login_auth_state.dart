part of 'login_auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoader extends AuthState {}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed({required this.error});
}

class AuthSuccess extends AuthState {
  final UserData userData;

  AuthSuccess({required this.userData});
}

class AuthCheck extends AuthState{
  final bool checkBox;

  AuthCheck({required this.checkBox});
}

class CheckboxCubit extends AuthState {
}

class CheckBoxValue extends AuthState{
  final bool checkValue;
  CheckBoxValue({required this.checkValue});
}