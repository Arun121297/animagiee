import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
// import 'package:animagieeui/view/instancepage/model/communiti_userList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/createcommendmodel.dart';

class CreateCommend {
  static final client = http.Client();

  static Future<CreateCommendmodel?> createcommentservice(
      {postid, commandword}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);

    try {
      final res = await client.post(Uri.parse(Urls.createcomment),
          body: json.encode({
            "postid": postid,
            "commandword": commandword,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(res.body);
      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        return CreateCommendmodel.fromJson(json);
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
