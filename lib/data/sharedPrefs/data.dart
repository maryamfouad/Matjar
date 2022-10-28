import 'package:shared_preferences/shared_preferences.dart';

class userSharedPrefs {
  static late SharedPreferences prefs;
  static const tokenKey = 'token';
  static const onBoardKey = 'onboard';
  static const isShopKey = 'isShop';
  static Future init() async => prefs = await SharedPreferences.getInstance();
  static clearPrefs() => prefs.clear();

  static Future setToken(token) async => await prefs.setString(tokenKey, token);
  static getToken() => prefs.getString(tokenKey);
  static clearToken() => prefs.remove(tokenKey);

  static Future setBoarding(status) async =>
      await prefs.setBool(onBoardKey, status);
  static getBoarding() => prefs.getBool(onBoardKey);
  static clearBoarding() => prefs.remove(onBoardKey);

  static Future setIsShop(status) async =>
      await prefs.setString(isShopKey, status);
  static getIsShop() => prefs.getString(isShopKey);
  static clearIsShop() => prefs.remove(isShopKey);
}
