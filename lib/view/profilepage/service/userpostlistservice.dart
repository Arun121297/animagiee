import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constance.dart';
import '../model/userpostmodellist.dart';
import 'package:http/http.dart' as http;

class UserPostServiceList {
  Future<UserPostModelList?> currentuserpostlist({Id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(Constants.authToken);
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(Urls.userpostprofileget));
    request.body = json.encode({"userid": Id.toString()});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // log(await response.stream.bytesToString());

      return userPostModelListFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    return null;
  }
}
