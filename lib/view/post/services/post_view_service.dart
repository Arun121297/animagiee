import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostViewService {
  //get my friends
  Future postView({required postId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"postid": postId ?? ""};
    try {
      var response = await http.post(Uri.parse(Urls.viewPost),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: body);

      log("uuuuu${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        var jsonData = jsonDecode(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
        return null;
        // Get.back();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
