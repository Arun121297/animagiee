import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseToken {
  static var instance = FirebaseMessaging.instance;

  static createToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await instance.getToken();
    if (token != null) {
      prefs.setString(Constant.firebaseToken, token);
      log(token);
      // final authToken = prefs.getString(Constant.authToken) ?? "";
    }
  }

  static deleteToken() async {
    instance.deleteToken();
  }
}
