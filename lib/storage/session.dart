import 'package:flutter_application_1/util/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getToken() async {
    return await _getPrefs().then((pref) {
      return pref.getString(KEY_TOKEN);
    });
  }
  Future<void> saveToken(String value) async {
    await _getPrefs().then((pref) {
      pref.setString(KEY_TOKEN, value);
    });
  }
}