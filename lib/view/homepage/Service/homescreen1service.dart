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
    String? token = prefs.getString(Constants.authToken);
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    try {
      var res = await client.get(Uri.parse(Urls.userpostlist), headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMxZWY3YmQ5OGFiZTI1OGQ1ZDM3YiIsImVtYWlsb3JwaG9uZSI6ImFydW4ubmsxMjEyOTdAZ21haWwuY29tIiwiaWF0IjoxNjcxMjYzOTY0fQ.qKpI6VLl24PFUdbSgVNXh9w2wlCwHKtWCysh4S3oVEw',
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
      print('yes$e');
      return null;
    }
  }
}
