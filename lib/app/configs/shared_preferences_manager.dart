import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(
    String key,
    String value,
  ) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  static String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  static Future<bool> setBool(
    String key,
    bool value,
  ) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  static bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  static Future<bool> setInt(
    String key,
    int value,
  ) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  static int getInt(String key) {
    return _prefs?.getInt(key) ?? 0;
  }

  static Future<bool> setDouble(
    String key,
    double value,
  ) async {
    return await _prefs?.setDouble(key, value) ?? false;
  }

  static double getDouble(String key) {
    return _prefs?.getDouble(key) ?? 0.0;
  }

  static Future<bool> setStringList(
    String key,
    List<String> value,
  ) async {
    return await _prefs?.setStringList(key, value) ?? false;
  }

  static List<String> getStringList(String key) {
    return _prefs?.getStringList(key) ?? [];
  }

  static Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  static Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }

  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
