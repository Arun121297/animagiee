import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/homepage/model/homecreatepostmodel.dart';
import 'package:animagieeui/view/post/models/joined_club_model.dart';
import 'package:animagieeui/view/post/models/my_friends_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<HomeCreatePostModel?> createSinglePost(
      {description, posttype, tagpeople, addimageorvideo, clubId}) async {
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
        "posttype": posttype.toString(),
        "tagPeople": tagpeople,
        "club": clubId,
        "indiviual": clubId == "" ? true : false,
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

        return HomeCreatePostModel.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //get my friends
  Future<MyFriendsModel?> getMyFriends() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    try {
      var response = await http.get(
        Uri.parse(Urls.myFrineds),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        return myFriendsModelFromJson(response.body);
      } else {
        var jsonData = jsonDecode(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //get joined club
  Future<JoinedClubModel?> getJoinedClub() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    try {
      var response = await http.get(
        Uri.parse(Urls.joinedClub),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        return joinedClubModelFromJson(response.body);
      } else {
        var jsonData = jsonDecode(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
