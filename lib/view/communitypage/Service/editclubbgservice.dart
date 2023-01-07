import 'dart:convert';
import 'dart:developer';

import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/Urls/urlsapi.dart';
import '../../../utils/constance.dart';
import '../model/createclubmodel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

import '../model/editclubbgmodel.dart';

class EditClubbgService {
  Future<EditClubbgiconModel?> editclubbgservicefunction(
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
    // log(clubicon);
    // if (clubicon != '') {
    //   log("Filename-->$clubicon");
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
      //         "clubbgicon": await dio.MultipartFile.fromFile(
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
      //         "clubbgicon": clubicon
      //       });
      // log("datasbg-->${isLocal}");
      // log("datasbg-->${formData.files[0].value.filename}");
      dio.Response response =
          await dio.Dio().postUri(Uri.parse(Urls.editbgclub),
              data: dio.FormData.fromMap({
                'CommunityTypeisPrivate': CommunityTypeisPrivat.toString(),
                'ClubDescription': ClubDescription.toString(),
                'groupName': groupName.toString(),
                'Community': Community.toString(),
                'clubid': clubid.toString(),
                'ClubName': clubname.toString(),
                "clubbgicon": clubicon
              }),
              options: dio.Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ));
      if (response.statusCode == 200) {
        log("Response${response.data}");
        return EditClubbgiconModel.fromJson(response.data);
      } else {
        log("error");
      }
    } catch (e) {
      log("eeebg-${e.toString()}");
    }
  }
}
