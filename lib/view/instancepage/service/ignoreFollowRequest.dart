import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/ignoreFollowRequest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteFollowRequestService {
  static var client = http.Client();

  static Future<DeleteFollowRequest?> deleteFollowRequestService(
    id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    final response = await client.post(Uri.parse(Urls.deletefollowrequest),
        body: json.encode({
          "requestId": id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    log(response.body);
    if (response.statusCode == 200) {
      // print(responseData);
      return deleteFollowRequestFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
