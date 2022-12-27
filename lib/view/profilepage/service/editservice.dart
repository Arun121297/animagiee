import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class EditScreenService {
  Future<EditModel?> editprofileservicesection(
      {yourself,
      profile_picture,
      fname,
      lname,
      dob,
      email,
      address,
      picode,
      mnumber}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    if (profile_picture != '') {
      log("Filename-->$fileNames");
      fileNames = profile_picture.toString().split('/').last;
      log("Filename-->$fileNames");
    }
    log("Fname-->$fname");
    log("PF-->$profile_picture");
    log("ABT-->$yourself");
    try {
      dio.FormData formData;
      if (profile_picture == '') {
        formData = dio.FormData.fromMap({
          "firstName": fname.toString(),
          "about": yourself.toString(),
          "profileicon": '',
          'dob': dob.toString(),
          "email": email.toString(),
          "mobNo": mnumber.toString(),
          "address": address.toString(),
          "pinCode": picode.toString(),
          "lastName": lname.toString()
        });
      } else {
        formData = dio.FormData.fromMap({
          'dob': dob.toString(),
          "lastName": lname.toString(),
          "email": email.toString(),
          "mobNo": mnumber.toString(),
          "address": address.toString(),
          "pinCode": picode.toString(),
          "firstName": fname.toString(),
          "about": yourself.toString(),
          "profileicon": await dio.MultipartFile.fromFile(
            profile_picture,
            filename: fileNames,
            contentType: MediaType(
              "image",
              "jpg",
            ),
          ),
        });
      }

      dio.Response response = await dio.Dio().post(Urls.editprofile,
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

        return editModelFromJson(json);
      } else {
        log("error");
      }
    } catch (e) {
      rethrow;
    }
    return null;

    // if (globalpFimage != '') {
    //   log("Filename-->$GfileNames");
    //   GfileNames = globalpFimage.toString().split('/').last;
    // }
  }
}
