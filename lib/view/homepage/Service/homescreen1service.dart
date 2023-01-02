import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/HomeScreen1model.dart';

class UserPostListService {
  static final client = http.Client();

  static Future<UserPostListModel?> userPostListService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Constants.authToken);
    log(token!);
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    try {
      var res = await http.get(Uri.parse(Urls.userpostlist), headers: {
        'Authorization': 'Bearer $token',
      });
      log(res.body);
      if (res.statusCode == 200) {
        log("result-->${res.body}");
        return userPostListModelFromJson(res.body);
      } else {
        return null;
      }
    } catch (e) {
      //
      //
      log('yes$e');
      return null;
    }
  }
}
