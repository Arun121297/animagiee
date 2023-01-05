import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/followRequestGetModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FollowRequestGetService {
  static final client = http.Client();

  static Future<FollowRequestGetModel?> followRequestGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    try {
      var res = await client.get(Uri.parse(Urls.followgetrequest), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("resbody${res.body}");
      if (res.statusCode == 200) {
        log("sugresult-->${res.body}");
        return followRequestGetModelFromJson(res.body);
      } else {
        return null;
      }
    } catch (e) {
      print('yes${e}');
      return null;
    }
  }
}