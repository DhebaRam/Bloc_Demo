import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mime/mime.dart';
import '../../comman/local_storage.dart';
import 'api_model.dart';

enum Method { post, get, delete, put, patch }

class APIManager {
  static final APIManager apiManagerInstance = APIManager._internal();
  factory APIManager() => apiManagerInstance;
  APIManager._internal();

  final LocalStorage localStorage = LocalStorage.localStorageSharedInstanace;

  Future<bool> _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  Future<ApiResponseModel> request(
    String webUrl,
    Method method,
    Map<String, dynamic> param,
  ) async {
    log(webUrl);
    log("Api URL .. $webUrl");
    log("Api param .. $param");
    final bool connectionStatus = await _checkConnection();
    late ApiResponseModel _apiResponse;
    late ErrorModel _error;
    if (!connectionStatus) {
      _error = ErrorModel(
        "No Internet",
        "No internet connection.",
        503,
      );
      Fluttertoast.showToast(
          msg: 'No internet connection.'
              .toString()
              .replaceFirst("HttpException: ", "")
              .replaceAll("\\", ''));
      return _apiResponse = ApiResponseModel(null, _error, false);
    }

    Dio dio = Dio();
    late Response response;
    Map<String, String> _headers = {};
    final String? token = await localStorage.getValue("token");
    print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) _headers['Authorization'] = "Bearer $token";
    _headers["Content-Type"] = "application/json";
    _headers["Accept-Language"] = prefs.getString("lang") ?? "en";
    String? encodedData = json.encode(param);
    log(encodedData);
    log(_headers.toString());
    log("header... $_headers");
    log(method.toString());
    try {
      if (method == Method.get) {
        log("Get API Calling");
        response = await dio.get(webUrl,
            options: Options(
              headers: _headers,
            ),
            queryParameters: param);
        print(response.toString());
      } else if (method == Method.post) {
        print('Post Method Calling----->');
        response = await dio.post(webUrl,
            options: Options(headers: _headers), data: encodedData);
        log('response.... ${response.data}');
        print(response.toString());
      } else if (method == Method.put) {
        response = await dio.put(webUrl,
            options: Options(headers: _headers), data: encodedData);
      } else if (method == Method.delete) {
        response =
            await dio.delete(webUrl, options: Options(headers: _headers));
      } else if (method == Method.patch) {
        response = await dio.patch(webUrl,
            options: Options(headers: _headers), data: encodedData);
      }
      print("Responce Data.. ${response.data}");
      print("Responce Data.. ${response.data}");
      print(response.statusCode);
      print(response.statusMessage);
      print(response.data);
      // if (response.data != null) {
      //   log("ashdgjhkasghhjgjh-===");
      //   final responseObject = json.decode(response.data);
      //   final prettyString =
      //   const JsonEncoder.withIndent('  ').convert(responseObject);
      //   log("ashdgjhkasghhjgjh" + prettyString);
      // }
      print("NAVagvdhg" + 'message ${response.statusCode}');
      print("NAVagvdhg...${response.statusCode}");
      print("NAVagvdhg...${response.data}");
      final responseData = response.data;

      print("Responce Dataa... ${responseData['message']}");
      print("Responce Dataa... ${responseData['message'].runtimeType}");
      if (responseData['message'] == "jwt expired" ||
          responseData['message'] == "wt malformed") {
        _error = ErrorModel(
          "Unauthorized",
          "Token Expired, Please login again.",
          responseData['statusCode'],
        );
        _apiResponse = ApiResponseModel(null, _error, false);
      }

      if (response.statusCode! >= 200 && response.statusCode! < 401) {
        if (response.data.isNotEmpty) {
          if (responseData['statusCode'] == 200 ||
              responseData['status'] == 200 ||
              responseData['responsecode'] == 200 && responseData['status']) {
            _apiResponse = ApiResponseModel(responseData, null, true);
          } else {
            _error = ErrorModel(
              "Error",
              "${responseData['message']}",
              responseData['responsecode'],
            );
            _apiResponse = ApiResponseModel(null, _error, false);
          }
        }
      } else if (response.statusCode == 401) {
        ErrorModel(
          "Unauthorized",
          "Token Expired, Please login again.",
          responseData['statusCode'],
        );
        _apiResponse = ApiResponseModel(null, _error, false);
      } else if (response.statusCode == 500) {
        _apiResponse = ApiResponseModel(
            null,
            ErrorModel(
              '',
              'Internal server error',
              responseData['statusCode'],
            ),
            false);
      } else {
        print("ahsvdjhas");
        if (response.data.isNotEmpty) {
          _error = ErrorModel(
            "",
            responseData['message'],
            responseData['responsecode'],
          );
          _apiResponse = ApiResponseModel(null, _error, false);
        } else {
          _error = ErrorModel(
            "Something went wrong!",
            "Looks like there was an error in reaching our servers. Press Refresh to try again or come back after some time.",
            504,
          );
          _apiResponse = ApiResponseModel(null, _error, false);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // Handle server error response
        log('Server error...: ${e}');
        log('Server error...: ${e.response!.statusCode}');
        log('Server error: ${e.response!.statusMessage}');
        log('Error Model... ${e.response!.statusCode}');
        _error = ErrorModel(
          "Something went wrong!",
          e.response!.data['message'],
          e.response!.statusCode!,
        );
        _apiResponse = ApiResponseModel(null, _error, false);
      } else {
        // log('Network error: ${e.message}');
        // log('Server error: ${e.response!.statusCode}');
        // log('Server error: ${e.response!.statusMessage}');
        // // Handle network error
        // log('Network error: ${e.message}');
        _error = ErrorModel(
          "Something went wrong!",
          "Something went wrong. Please try again.",
          e.response?.statusCode ?? 400,
        );
        _apiResponse = ApiResponseModel(null, _error, false);
      }
    } catch (e) {
      log("asjdajshdfsj");
      log("$e");
      _error = ErrorModel(
        "Something went wrong!",
        "Something went wrong. Please try again.",
        504,
      );
      _apiResponse = ApiResponseModel(null, _error, false);
    }
    log('Return Api Response.... $_apiResponse');
    return _apiResponse;
  }

  Future<ApiResponseModel> multipartRequest(
      String webUrl,
      List<FileInfo> _files,
      List<FileInfoInt>? _filesInt,
      Method method,
      Map<String, dynamic> param,
      {bool byteData = false,
      List<int>? imageData,
      path,
      name}) async {
    var status = await _checkConnection();
    late ErrorModel _error;
    late ApiResponseModel _apiResponse;
    if (status != true) {
      var error =
          ErrorModel("No Internet", "Check Your Network Connection", 500);
      return ApiResponseModel("", error, false);
    }
    print(webUrl);
    Dio dio = Dio();
    late Response response;
    Map<String, String> _headers = {};
    FormData formData = FormData.fromMap({});
    var multipartFile;
    if (byteData) {
      for (var item in _filesInt!) {
        multipartFile = await MultipartFile.fromBytes(
          item.file,
          filename: "${item.name}.${item.ext}",
          contentType: MediaType(
              "${lookupMimeType(item.path, headerBytes: item.file)}",
              "${lookupMimeType(item.path)}"),
        );
        formData.files.add(MapEntry(item.key, multipartFile));
      }
    } else {
      for (var item in _files) {
        multipartFile = await MultipartFile.fromBytes(
          byteData ? imageData! : File(item.file.path).readAsBytesSync(),
          filename: "${item.name}.${item.ext}",
          contentType: MediaType(
              "${lookupMimeType(item.file.path, headerBytes: item.file.readAsBytesSync())}",
              "${lookupMimeType(item.file.path)}"),
        );

        formData.files.add(MapEntry(item.key, multipartFile));
      }
    }

    var token = await appAuth.getValue("token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) _headers['Authorization'] = "Bearer $token";
    _headers["Content-Type"] = "application/json";
    _headers["Accept-Language"] = prefs.getString("lang") ?? "en";
    formData.fields
        .addAll(param.entries.map((e) => MapEntry(e.key, e.value.toString())));

    try {
      if (method == Method.post) {
        response = await dio.post(webUrl,
            options: Options(headers: _headers), data: formData);
      } else if (method == Method.patch) {
        response = await dio.patch(webUrl,
            options: Options(headers: _headers), data: formData);
      } else if (method == Method.put) {
        response = await dio.put(webUrl,
            options: Options(headers: _headers), data: formData);
      }

      print(response.toString());
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      print(response.data);
      print("NAVagvdhg" + 'message');
      final responseData = response.data;
      print("NAVagvdhg" + responseData['message']);
      if (response.statusCode! < 300 && response.statusCode! >= 200) {
        var data = response.data;
        log(data.toString());
        if ((data['statusCode'] == 200 && data['statusCode'] < 300) ||
            responseData['responsecode'] == 200) {
          return _apiResponse = ApiResponseModel(data, null, true);
        } else {
          String error = data["message"];
          ErrorModel apiResponse = ErrorModel("", error, data['statusCode']);
          return _apiResponse = ApiResponseModel(null, apiResponse, false);
        }
      } else if (response.statusCode == 500) {
        ErrorModel apiResponse = ErrorModel(
          "Something went wrong!",
          "Looks like there was an error in reaching our servers. Press Refresh to try again or come back after some time.",
          504,
        );
        return _apiResponse = ApiResponseModel(null, apiResponse, false);
      } else {
        var errorData = json.decode(response.data);
        String error = errorData["message"];
        ErrorModel apiResponse = ErrorModel("", error, errorData['statusCode']);
        return _apiResponse = ApiResponseModel(null, apiResponse, false);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // Handle server error response
        print(e.response);
        _error = ErrorModel(
          "Something went wrong!",
          e.response?.data['message'] ?? "Something went wrong!",
          e.response!.statusCode!,
        );
        return _apiResponse = ApiResponseModel(null, _error, false);
      } else {
        _error = ErrorModel(
          "Something went wrong!",
          "Something went wrong. Please try again.",
          e.response!.statusCode!,
        );
        return _apiResponse = ApiResponseModel(null, _error, false);
      }
    } catch (e) {
      print("asjdajshdfsj");
      log("$e");
      _error = ErrorModel(
        "Something went wrong!",
        "Something went wrong. Please try again.",
        504,
      );
      return _apiResponse = ApiResponseModel(null, _error, false);
    }
  }
}
