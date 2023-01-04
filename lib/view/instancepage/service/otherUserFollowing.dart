import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/otherUserFollowing.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtherUserFollowingService {
  static var client = http.Client();

  static Future<OtherUserFollowing?> otherUserFollowingService(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response = await client.post(Uri.parse(Urls.otheruserfollowing),
        body: json.encode({
          "userid": id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    log(response.body);
    if (response.statusCode == 200) {
      // print(responseData);
      return otherUserFollowingFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
