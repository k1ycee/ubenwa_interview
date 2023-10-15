import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService();

  static late SharedPreferences pref;

  static bool get isOnboarded => pref.getBool('isOnboarded') ?? false;

  static Future<void> init() async {
    try {
      pref = await SharedPreferences.getInstance();
    } catch (e) {
      log(e.toString());
    }
  }

  static void saveIsOnboarded(bool val) async {
    await pref.setBool('isOnboarded', val);
  }
}
