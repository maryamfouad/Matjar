import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class userSharedPrefs {
  static late SharedPreferences prefs;
  static const tokenKey = 'token';
  static const onBoardKey = 'onboard';
  static const isShopKey = 'isShop';
  static const cartKey = 'cart';
  static Future init() async => prefs = await SharedPreferences.getInstance();
  static clearPrefs() => prefs.clear();

  static Future setToken(token) async => await prefs.setString(tokenKey, token);
  static getToken() => prefs.getString(tokenKey);
  static clearToken() => prefs.remove(tokenKey);

  static Future setBoarding(status) async =>
      await prefs.setBool(onBoardKey, status);
  static getBoarding() => prefs.getBool(onBoardKey);
  static clearBoarding() => prefs.remove(onBoardKey);

  static Future setCartList(status) async =>
      await prefs.setStringList(cartKey, status);
  static getCart() => prefs.getStringList(cartKey);
  static clearCart() => prefs.remove(cartKey);

  static Future setIsShop(status) async =>
      await prefs.setString(isShopKey, status);
  static getIsShop() => prefs.getString(isShopKey);
  static clearIsShop() => prefs.remove(isShopKey);


   static Future setCartMap(List<Map> listOfMaps) async {
    List<String> cartsStringList = [];
    listOfMaps.forEach((element) {
      cartsStringList.add(json.encode(element));
    });
    await setCartList(cartsStringList);
  }

  static List<Map> getCartMap() {
    List<String> itemsString =
        getCart() ?? [];
    List<Map> items = [];
    if (itemsString.isNotEmpty) {
      itemsString.forEach((element) {
        items.add(json.decode(element));
      });
    }
    return items;
  }
}
