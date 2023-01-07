import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/member.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MemberService {
  static final client = http.Client();

  static Future<ClubMembersModel?> memberService(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);

    try {
      final res = await client.post(Uri.parse(Urls.memberList), body: {
        "clubid": id,
      }, headers: {
        'Authorization': 'Bearer $token',
      });
      log(res.body);
      if (res.statusCode == 200) {
        return clubMembersModelFromJson(res.body);
      } else {
        return null;
      }
    } catch (e) {
      //
      //
      print('yes$e');
      return null;
    }
  }
}
