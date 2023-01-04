import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubService {
  static var client = http.Client();

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
      log('response-----${response.data}');

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
