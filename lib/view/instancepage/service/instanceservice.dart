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
    var url = Uri.parse(Urls.communities);
    var token = sharedPreferences.getString(Constants.authToken);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      var json = jsonDecode(response.body);

      return CommunitiesList.fromJson(json);
    } else {
      log("Error");
    }
  }
}
