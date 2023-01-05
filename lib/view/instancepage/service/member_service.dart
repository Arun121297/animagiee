import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/member.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class MemberService {
  static final client = http.Client();

  static Future<Member?> memberService(
      String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);

    try {
      final res = await client.post(Uri.parse(Urls.memberList),
          body: json.encode({
            "clubid": id,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(res.body);
      if (res.statusCode == 200) {
        return memberFromJson(res.body);
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

