import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import '../controller/editclubcontroller.dart';
import '../model/createclubmodel.dart';
import 'package:http/http.dart' as http;

import '../model/editclubbgmodel.dart';
import '../model/editclubmodel.dart';

class EditClubService {
  // EditClubController editClubController = Get.put(EditClubController());
  Future<EditClubModel?> editclubservicefunction(
      {clubid,
      clubname,
      CommunityTypeisPrivat,
      ClubDescription,
      groupName,
      Community,
      clubicon}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    // if (clubicon != '') {
    //   log("Filename-->$fileNames");
    //   fileNames = clubicon.toString().split('/').last;
    //   log("Filename-->$fileNames");
    // }
    try {
      // final isLocal = !clubicon.toString().contains('http');
      // final dio.FormData formData = isLocal
      //     ? dio.FormData.fromMap({
      //         'CommunityTypeisPrivate': CommunityTypeisPrivat.toString(),
      //         'ClubDescription': ClubDescription.toString(),
      //         'groupName': groupName.toString(),
      //         'Community': Community.toString(),
      //         'clubid': clubid.toString(),
      //         'ClubName': clubname.toString(),
      //         "clubicon": await dio.MultipartFile.fromFile(
      //           clubicon,
      //           filename: fileNames,
      //           // contentType: MediaType(
      //           //   "image",
      //           //   "jpg",
      //           // ),
      //         ),
      //       })
      //     : dio.FormData.fromMap({
      //         'CommunityTypeisPrivate': CommunityTypeisPrivat.toString(),
      //         'ClubDescription': ClubDescription.toString(),
      //         'groupName': groupName.toString(),
      //         'Community': Community.toString(),
      //         'clubid': clubid.toString(),
      //         'ClubName': clubname.toString(),
      //         "clubicon": clubicon
      //       });
      // log("datas-->${formData.toString()}");
      final response = await dio.Dio().postUri(Uri.parse(Urls.editclub),
          data: dio.FormData.fromMap({
            'clubid': clubid.toString(),
            'CommunityTypeisPrivate': CommunityTypeisPrivat.toString(),
            'ClubDescription': ClubDescription.toString(),
            'groupName': groupName.toString(),
            'Community': Community.toString(),
            'ClubName': clubname.toString(),
            'clubicon': clubicon
          }),
          options: dio.Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        log("Responseicon${response.data}");
        return EditClubModel.fromJson(response.data);
      } else {
        log("error");
      }
    } catch (e) {
      log("eeei j-${e.toString()}");
      rethrow;
    }
  }
}
