// utils/shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String keyIntroSeen = 'intro_seen';
  static const String keyUserLoggedIn = 'user_logged_in';

  static Future<SharedPreferences> get _instance async =>
      await SharedPreferences.getInstance();

  // Save intro seen
  static Future<bool> setIntroSeen(bool value) async {
    final SharedPreferences prefs = await _instance;
    return prefs.setBool(keyIntroSeen, value);
  }

  // Get intro seen status
  static Future<bool> isIntroSeen() async {
    final SharedPreferences prefs = await _instance;
    return prefs.getBool(keyIntroSeen) ?? false;
  }

  // Clear all data
  static Future<bool> clearAll() async {
    final SharedPreferences prefs = await _instance;
    return prefs.clear();
  }
}
