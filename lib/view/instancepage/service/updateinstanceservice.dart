import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/instancepage/model/updateinstance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;

class UpdateInstanceService {
  Future<UpdateInstanceModel?> updateService({instancelist}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var url = Uri.parse(Urls.updatecommunities);
    var token = sharedPreferences.getString(Constants.authToken);
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('http://192.168.1.32:9000/api/community/mycommunityupdate'));
    request.body = json.encode({"interestedCommunities": instancelist});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = jsonDecode(await response.stream.bytesToString());
      return UpdateInstanceModel.fromJson(json);
    } else {
      log("${response.reasonPhrase}");
    }
    // var data = {"instancelist": instancelist};
    // var response = await http.post(url,
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //     },
    //     body: data);
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   log("updatebody-->${response.body}");
    //   var json = jsonDecode(response.body);

    //   return UpdateInstanceModel.fromJson(json);
    // } else {
    //   log("Error");
    // }
  }
}
