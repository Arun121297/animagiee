import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import 'package:dio/dio.dart' as dio;

class EditScreenService {
  Future<EditModel?> editprofileservicesection(
      {yourself,
      profilePicture,
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
    if (profilePicture != '') {
      log("Filename-->$fileNames");
      fileNames = profilePicture.toString().split('/').last;
      log("Filename-->$fileNames");
    }
    log("Fname-->$fname");
    log("PF-->$profilePicture");
    log("ABT-->$yourself");
    try {
      dio.FormData formData;
      if (profilePicture == '') {
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
          "profileicon": profilePicture == ""
              ? ""
              : await dio.MultipartFile.fromFile(
                  profilePicture,
                  filename: fileNames,
                  // contentType: MediaType(
                  //   "image",
                  //   "jpg",
                  // ),
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
