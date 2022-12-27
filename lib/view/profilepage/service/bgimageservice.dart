import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import '../model/backgroundimagemodel.dart';
import 'package:http/http.dart' as http;

class BGService {
  Future<ProfileBackGroundImageModel?> profilebGimageservice({bgimage}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    if (bgimage != '') {
      log("Filename-->$fileNames");
      fileNames = bgimage.toString().split('/').last;
    }
    try {
      dio.FormData formData;
      if (bgimage == '') {
        formData = dio.FormData.fromMap({"profilebackimg": ''});
      } else {
        formData = dio.FormData.fromMap({
          "profilebackimg": await dio.MultipartFile.fromFile(
            bgimage,
            filename: fileNames,
            contentType: MediaType(
              "image",
              "jpg",
            ),
          ),
        });
      }

      dio.Response response = await dio.Dio().post(Urls.bgimage,
          data: formData,
          options: dio.Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));

      log("Datasss john${response.data}");

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        // log(json.toString());

        return profileBackGroundImageModelFromJson(json);
      } else {
        log("error");
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
