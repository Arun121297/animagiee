import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

import '../model/homecreatepostmodel.dart';

class HomeScreenCreateIndividualPost {
  Future<HomeCreatePostModel?> createindividualpost(
      {description,
      posttype,
      // tagpeople,
      addimageorvideo}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    if (addimageorvideo != '') {
      log("Filename-->$fileNames");
      fileNames = addimageorvideo.toString().split('/').last;
      log("Filename-->$fileNames");
    }
    try {
      dio.FormData formData;
      formData = dio.FormData.fromMap({
        "description": description.toString(),
        "posttype": posttype,
        // "tagPeople": tagpeople.toString(),
        "addImagesOrVideos": await dio.MultipartFile.fromFile(
          addimageorvideo,
          filename: fileNames,
          contentType: MediaType(
            "image",
            "jpg",
          ),
        ),
      });

      dio.Response response = await dio.Dio().post(Urls.homecreatepost,
          data: formData,
          options: dio.Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));

      log("Datasss john${response.data}");

      if (response.statusCode == 200) {
        // var json = jsonDecode(response.data);
        // log(json.toString());

        return homeCreatePostModelFromJson(response.data);
      } else {
        log("error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
