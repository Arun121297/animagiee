import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:animagieeui/view/instancepage/model/club_icon.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubIconService {
  static var client = http.Client();
  // static Future<Clubcreation?> clubService(
  //     String clubName,
  //     String clubDescription,
  //     String groupName,
  //     bool communityTypeisPrivate,
  //     String community) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString(Constants.authToken);

  //   final response = await client.post(
  //       Uri.parse('http://192.168.1.32:9000/api/club/clubcreation'),
  //       body: json.encode({}),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMxZWY3YmQ5OGFiZTI1OGQ1ZDM3YiIsImVtYWlsb3JwaG9uZSI6ImFydW4ubmsxMjEyOTdAZ21haWwuY29tIiwiaWF0IjoxNjcxMjUzMDY3fQ.Hc09gD0Nh8mPjMt1xSqD7aBKcQu7UItwtzSh5sUqTFI',
  //       });

  //   if (response.statusCode == 200) {
  //     // final responseData = json.decode(response.body) as Map<String, dynamic>;
  //     // print(responseData);
  //     return clubcreationFromJson(response.body);
  //   } else {
  //     log("${response.reasonPhrase}");
  //     return null;
  //   }
  // }

  Future<ClubCreation?> clubIconService({
    file,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    String fileName = '';
    if (file != '') {
      log("Filename-->$fileName");
      fileName = file.toString().split('/').last;
      log("Filename-->$fileName");
    }

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "clubbgicon": await dio.MultipartFile.fromFile(file,
            filename: fileName,
            contentType: MediaType(
              "image",
              "jpg",
            )),
      });

      var response =
          await dio.Dio().post('http://192.168.1.32:9000/api/club/iconcreation',
              data: formData,
              options: dio.Options(headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      print('response-----${response.data}');
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final responseData = json.decode(response.data);

        // return clubCreationModelFromJson(response.data);
        return ClubCreation.fromJson(response.data);
      } else {
        // Fluttertoast.showToast(
        //   msg: json.decode(response.statusMessage!),
        // );
        return null;
      }
    } on dio.DioError catch (e) {
      //
      //
      print('yes${e.response}');
      return null;
    }
  }
}
