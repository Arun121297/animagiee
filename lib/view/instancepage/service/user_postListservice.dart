import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../homepage/model/HomeScreen1model.dart';

class UserPostListService {
  static final client = http.Client();

  static Future<UserPostListModel?> userPostListService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    try {
      var res = await client.get(Uri.parse(Urls.userpostlist), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(res.body);
      if (res.statusCode == 200) {
        return userPostListModelFromJson(res.body);
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
