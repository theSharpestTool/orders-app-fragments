import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveToCache(String key, String data) =>
      _prefs.setString(key, data);

  static String loadFromCache(String key) => _prefs.getString(key);
}
