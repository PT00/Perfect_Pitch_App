import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _highScore = 'score';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setHighScore(String score) async =>
      await _preferences.setString(_highScore, score);

  static String? getHighScore() => _preferences.getString(_highScore);
}
