import 'dart:developer';

import 'package:bloc_demo/login_auth/models/login_model.dart';
import 'package:bloc_demo/utils/api_manager/api_manager.dart';
import '../auth_provider/auth_provider.dart';

class AuthRepository {
  // final AuthDataProvider authDataProvider = AuthDataProvider();
  final AuthDataProvider authDataProvider;

  AuthRepository(this.authDataProvider);

  Future<UserData> checkAuthCredential(
      Map<String, dynamic> param, Method method) async {
    try {
      final loginData =
          await authDataProvider.verifyAuthCredential(param, method);
      if (!loginData.status) {
        throw loginData.error!.title.toString();//'An unexpected error occurred';
      }
      return UserData.fromJson(loginData.data['data']);
    } catch (e) {
      throw e.toString();
    }
  }
}
