import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/instancepage/model/updateinstance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;

class UpdateInstanceService {
  Future<UpdateInstanceModel?> updateService(
      {required List<String> instancelist}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var data = instancelist
        .map(
          (e) => '$e',
        )
        .toList();
    log("Datasss$data");
    var request = await http.post(Uri.parse(Urls.updatecommunities),
        headers: headers, body: jsonEncode({"interestedCommunities": data}));

    log("Datasss john${request.body}");

    if (request.statusCode == 200) {
      var json = jsonDecode(request.body);
      log(json.toString());

      return UpdateInstanceModel.fromJson(json);
    } else {}
  }
}
