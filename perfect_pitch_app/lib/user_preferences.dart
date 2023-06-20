import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _highScore = 'score';
  static const _rounds = 'rounds';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setHighScore(String score) async =>
      await _preferences.setString(_highScore, score);

  static String? getHighScore() => _preferences.getString(_highScore);

  static Future setRounds(int rounds) async =>
      await _preferences.setInt(_rounds, rounds);

  static int? getRounds() => _preferences.getInt(_rounds);
}
