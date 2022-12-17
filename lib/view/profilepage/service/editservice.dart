import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;

class EditScreenService {
  Future<EditModel?> editprofileservicesection({yourself}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);
    var data = {"about": yourself.toString()};
    var request = await http.post(
      Uri.parse(Urls.editprofile),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: data,
    );

    log("Datasss john${request.body}");

    if (request.statusCode == 200) {
      var json = jsonDecode(request.body);
      // log(json.toString());

      return editModelFromJson(request.body);
    } else {
      log("error");
    }
  }
}
