import 'dart:convert';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/home_search.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchHomeServices {
  static var client = http.Client();

  static Future<HomeSearchModel?> searchHomeService(
    String userName,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    final response = await client.post(Uri.parse(Urls.homesearch),
        body: json.encode({
          "searchword": userName,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      // print(responseData);
      return homeSearchModelFromJson(response.body);
      // return  HomeSearchModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
