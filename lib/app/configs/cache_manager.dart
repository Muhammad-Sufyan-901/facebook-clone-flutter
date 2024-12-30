import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static const String _timeKey = '_cache_time_';
  static const String _dataKey = '_cache_data_';
  static const Duration _defaultDuration = Duration(days: 1);

  static Future<void> saveData(
    String key,
    dynamic value, {
    Duration? duration,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryTime = DateTime.now().add(duration ?? _defaultDuration);

    await prefs.setString('$_timeKey$key', expiryTime.toIso8601String());
    await prefs.setString('$_dataKey$key', json.encode(value));
  }

  static Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryTimeStr = prefs.getString('$_timeKey$key');
    final cachedData = prefs.getString('$_dataKey$key');

    if (expiryTimeStr == null || cachedData == null) {
      return null;
    }

    final expiryTime = DateTime.parse(expiryTimeStr);

    if (DateTime.now().isAfter(expiryTime)) {
      await removeData(key);
      return null;
    }

    return json.decode(cachedData);
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('$_timeKey$key');
    await prefs.remove('$_dataKey$key');
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    for (final key in keys) {
      if (key.startsWith(_timeKey) || key.startsWith(_dataKey)) {
        await prefs.remove(key);
      }
    }
  }

  static Future<bool> hasValidCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryTimeStr = prefs.getString('$_timeKey$key');

    if (expiryTimeStr == null) return false;

    final expiryTime = DateTime.parse(expiryTimeStr);

    return DateTime.now().isBefore(expiryTime);
  }
}
