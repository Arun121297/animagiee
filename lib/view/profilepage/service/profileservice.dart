import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import '../model/profiledata.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<ProfileModel?> profileservicesection() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);

    var request = await http.get(
      Uri.parse(Urls.profile),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    log("Datasss john${request.body}");

    if (request.statusCode == 200) {
      var json = jsonDecode(request.body);
      // log(json.toString());

      return profileModelFromJson(request.body);
    } else {
      log("error");
    }
    return null;
  }
}
