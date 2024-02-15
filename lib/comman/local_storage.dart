import 'package:shared_preferences/shared_preferences.dart';

LocalStorage appAuth = LocalStorage();

class LocalStorage {
  static final LocalStorage localStorageSharedInstanace = LocalStorage._internal();
  factory LocalStorage() => localStorageSharedInstanace;
  LocalStorage._internal();

  String token = "token", login = 'login', onboarding = 'onboarding', userId = "userId";

  Future<void> setValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('SharedPreferences Token ---> ');
    final String? value = prefs.getString(key);
    return value;
  }

  Future<bool?> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? value = prefs.getBool(key);
    return value;
  }

  Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
