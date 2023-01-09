import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/communityProfile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommunityProfileService {
  static var client = http.Client();

  static Future<CommunityProfileModel?> communityProfileService(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    log(id);
    var body = {"clubid": id};
    final response = await client
        .post(Uri.parse(Urls.communityprofile), body: body, headers: {
      'Authorization': 'Bearer $token',
    });
    log("ggggggggg${response.body}");
    if (response.statusCode == 200) {
      // print(responseData);
      return communityProfileModelFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
