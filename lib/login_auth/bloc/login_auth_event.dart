part of 'login_auth_bloc.dart';

@immutable
sealed class LoginAuthEvent {}

final class LoginAuthCreate extends LoginAuthEvent{
  final String emailId;
  final String password;
  // final bool checkValue;

  LoginAuthCreate({required this.emailId, required this.password});
}

final class CheckBoxUpdate extends LoginAuthEvent{
  final bool checkBoxValue;
  CheckBoxUpdate({required this.checkBoxValue});
}