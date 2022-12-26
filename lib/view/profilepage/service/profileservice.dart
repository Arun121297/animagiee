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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMxZWY3YmQ5OGFiZTI1OGQ1ZDM3YiIsImVtYWlsb3JwaG9uZSI6ImFydW4ubmsxMjEyOTdAZ21haWwuY29tIiwiaWF0IjoxNjcxMjUzMDY3fQ.Hc09gD0Nh8mPjMt1xSqD7aBKcQu7UItwtzSh5sUqTFI',
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
  }
}
