import 'package:hive_ce/hive.dart';

class VPrefs {
  VPrefs._();

  static final Box _box = Hive.box('prefs');

  // --> String
  static Future<void> setString(String key, String value) async =>
      await _box.put(key, value);
  static String? getString(String key) => _box.get(key);

  // --> Int
  static Future<void> setInt(String key, int value) async =>
      await _box.put(key, value);
  static int? getInt(String key) => _box.get(key);

  // --> Bool
  static Future<void> setBool(String key, bool value) async =>
      await _box.put(key, value);
  static bool? getBool(String key) => _box.get(key);

  // --> remove
  static Future<void> remove(String key) async => await _box.delete(key);

  // --> clear all
  static Future<void> clear() async => await _box.clear();

  // -->

}
