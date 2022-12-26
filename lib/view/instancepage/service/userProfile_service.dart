import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/userProfile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constance.dart';

class UserPostProfile {
  static var client = http.Client();

  static Future<UserProfileModel?> userPostProfile(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response = await client.post(Uri.parse(Urls.userpostprofile),
        body: json.encode({
          "otheruserid": id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // print(responseData);
      return userProfileModelFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
