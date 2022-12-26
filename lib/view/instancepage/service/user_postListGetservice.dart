import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/user_postGetmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPostGetListService {
  static final client = http.Client();

  static Future<UserPostListGetModel?> userPostGetListService(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);

    try {
      final res = await client.post(Uri.parse(Urls.userpostprofileget),
          body: json.encode({
            "userid": id,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(res.body);
      if (res.statusCode == 200) {
        return userPostListGetModelFromJson(res.body);
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
