import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/userprofile/models/other_user_followers_model.dart';
import 'package:animagieeui/view/userprofile/models/other_user_following_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtherUserService {
  static var client = http.Client();

  Future<OtherUserFollowersModel?> otherUserFollowersService(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response =
        await client.post(Uri.parse(Urls.otherUserFollowers), body: {
      "otherpersonid": id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    log(response.body);
    if (response.statusCode == 200) {
      // print(responseData);
      return otherUserFollowersModelFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<OtherUserFollowingModel?> otherUserFollowingService(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response =
        await client.post(Uri.parse(Urls.otherUserFollowing), body: {
      "otherpersonid": id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    log(response.body);
    if (response.statusCode == 200) {
      // print(responseData);
      return otherUserFollowingModelFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
