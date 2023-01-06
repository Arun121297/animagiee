import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/communityPostList.dart';
import 'package:http/http.dart' as http;

class CommunityPostListService {
  static var client = http.Client();

  static Future<CommunityPostList?> communityPostListService(userId, id) async {
    final response = await client.post(
      Uri.parse(Urls.communitypostlist),
      body: {"myuserid": userId, "clubid": id},
    );
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
