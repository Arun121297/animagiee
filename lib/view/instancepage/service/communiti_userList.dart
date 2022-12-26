import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/communiti_userList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommunitiListService {
  static final client = http.Client();

  static Future<CommunitiUserListModel?> communitiUserPostListService(
      String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);

    try {
      final res = await client.post(Uri.parse(Urls.communitiUserpost),
          body: json.encode({
            "userid": id,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(res.body);
      if (res.statusCode == 200) {
        return communitiUserListModelFromJson(res.body);
      } else {
        return null;
      }
    } catch (e) {
      //
      //
      print('yes${e}');
      return null;
    }
  }
}
