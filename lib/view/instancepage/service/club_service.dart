import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubService {
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

  Future<ClubCreationModel?> clubService({
    clubName,
    clubDescription,
    groupName,
    communityTypeisPrivate,
    community,
    file,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    String fileNames = '';
    if (file != '') {
      log("Filename-->$fileNames");
      fileNames = file.toString().split('/').last;
      log("Filename-->$fileNames");
    }

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "Clubicon": await dio.MultipartFile.fromFile(file,
            filename: fileNames,
            contentType: MediaType(
              "image",
              "jpg",
            )),
        "groupName": groupName,
        "ClubName": clubName,
        "ClubDescription": clubDescription,
        "Community": community,
        "CommunityTypeisPrivate": communityTypeisPrivate
      });

      var response = await dio.Dio().post(Urls.clubcreation,
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
        return ClubCreationModel.fromJson(response.data);
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
