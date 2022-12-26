import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/userProfile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPostProfile {
  static var client = http.Client();

  static Future<UserProfileModel?> userPostProfile(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    final response = await client.post(Uri.parse(Urls.userpostprofile),
        body: json.encode({
          "otheruserid": id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMxZWY3YmQ5OGFiZTI1OGQ1ZDM3YiIsImVtYWlsb3JwaG9uZSI6ImFydW4ubmsxMjEyOTdAZ21haWwuY29tIiwiaWF0IjoxNjcxMjUzMDY3fQ.Hc09gD0Nh8mPjMt1xSqD7aBKcQu7UItwtzSh5sUqTFI',
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
