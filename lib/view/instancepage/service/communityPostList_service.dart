import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/communityPostList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommunityPostListService {
  static var client = http.Client();

  static Future<CommunityPostList?> communityPostListService(userId, id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString(Constant.authToken);
    final response =
        await client.post(Uri.parse(Urls.communitypostlist), body: {
      "myuserid": userId,
      "clubid": id
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    log(response.body);

    if (response.statusCode == 200) {
      // print(responseData);
      return communityPostListFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
