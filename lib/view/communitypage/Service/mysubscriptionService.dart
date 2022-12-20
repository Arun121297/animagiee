import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import '../model/MySubscriptions.dart';
import 'package:http/http.dart' as http;

class MySubscriptionService {
  // Future<CommunitieSelectedList?> mysubscriptionservice() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var url = Uri.parse(Urls.mysubscription);
  //   var token = sharedPreferences.getString(Constants.authToken);
  //   var response = await http.get(url, headers: {
  //     'Authorization': 'Bearer $token',
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     log(response.body);
  //     var json = jsonDecode(response.body);

  //     return CommunitieSelectedList.fromJson(json);
  //   } else {
  //     log("Error");
  //   }
  // }
}
