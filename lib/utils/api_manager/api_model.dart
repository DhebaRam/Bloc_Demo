import 'dart:io';

class ApiResponseModel {
  ErrorModel? error;
  bool status;
  dynamic data;

  ApiResponseModel(this.data, this.error, this.status);
}

class ErrorModel {
  String title, description;
  int statusCode;

  ErrorModel(this.title, this.description, this.statusCode);
}

class FileInfo {
  File file;
  String key, name, ext;

  FileInfo(this.file, this.key, this.name, this.ext);
}

class FileInfoInt {
  List<int> file;
  String key, name, ext, path;

  FileInfoInt(this.file, this.key, this.name, this.ext, this.path);
}
