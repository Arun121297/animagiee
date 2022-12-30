import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/myFollowersModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyFollowingService {
  static var client = http.Client();

  static Future<MyFollowers?> myFollowerService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response = await client.post(Uri.parse(Urls.myfollower), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    log(response.body);
    if (response.statusCode == 200) {
      // print(responseData);
      return myFollowersFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
