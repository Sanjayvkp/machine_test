import 'package:shared_preferences/shared_preferences.dart';

class Login {
  static Future<void> setLogged(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedin', value);
  }

  static Future<String> getLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('loggedin') ?? '';
  }

  static Future<void> removelogged() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('loggedin');
  }
}
