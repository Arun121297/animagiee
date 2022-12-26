import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/instancemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;

class InstanceService {
  Future<CommunitiesList?> instanceservice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    try {
      log("cmtoken-->$token");
      var url = Uri.parse(Urls.communities);
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        log(response.body);
        // var json = jsonDecode(response.body);
        // log("jdon-->${json}");
        return communitiesListFromJson(response.body);
      } else {
        log("Error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
