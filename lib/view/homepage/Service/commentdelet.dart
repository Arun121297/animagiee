import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
// import 'package:animagieeui/view/instancepage/model/communiti_userList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommentDeletService {
  static final client = http.Client();

  static Future mycommentdeletservice({commandid}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);

    try {
      final res = await client.post(Uri.parse(Urls.deletecomment),
          body: json.encode({
            "commandid": commandid,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(res.body);
      if (res.statusCode == 200) {
        return (res.body);
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
