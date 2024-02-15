import 'package:bloc_demo/utils/api_manager/api_manager.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_manager/api_model.dart';

const webUrl = 'https://v1.checkprojectstatus.com/airbet88/api/login';

class AuthDataProvider {
  final APIManager _apiManager = APIManager.apiManagerInstance;

  Future<ApiResponseModel> verifyAuthCredential(
      Map<String, dynamic> param, Method method) async {
    try {
      final res = await _apiManager.request(webUrl, method, param);
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
