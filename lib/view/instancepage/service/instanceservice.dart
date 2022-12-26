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
      var url =
          Uri.parse('http://192.168.1.32:9000/api/community/communitydetails');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMxZWY3YmQ5OGFiZTI1OGQ1ZDM3YiIsImVtYWlsb3JwaG9uZSI6ImFydW4ubmsxMjEyOTdAZ21haWwuY29tIiwiaWF0IjoxNjcxMjUzMDY3fQ.Hc09gD0Nh8mPjMt1xSqD7aBKcQu7UItwtzSh5sUqTFI',
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
