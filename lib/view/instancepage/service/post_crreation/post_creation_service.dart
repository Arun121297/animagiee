import 'dart:developer';
import 'dart:io';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/post_creation/post_creation_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

class PostCreation1Service {
  static var client = http.Client();

  Future<PostCreation?> postCreationService({
    file,
    posttype,
    indiviual,
    club,
    description,
    tagPeople,
   
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
        "as htt": await dio.MultipartFile.fromFile(file,
            filename: fileNames,
            contentType: MediaType(
              "image",
              "jpg",
            )),

        "posttype": posttype,
        "indiviual": indiviual,
        "club": club,
        "description": description,
        "tagPeople": tagPeople,
       
      });

      var response =
          await dio.Dio().post('http://192.168.1.32:9000/api/post/postcreation',
              data: formData,
              options: dio.Options(headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMwNjc2YmQ5OGFiZTI1OGQ1ZDM1YiIsImVtYWlsb3JwaG9uZSI6InNhdGhpc2hAZ21haWwuY29tIiwiaWF0IjoxNjcxMjU1NTczfQ.KmD4Jp7PxuH2-zSS-TEnopJvPi3bhTZkNilaTFx1yDQ',
              }));
      print('response-----${response.data}');
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final responseData = json.decode(response.data);

        // return clubCreationModelFromJson(response.data);
        return PostCreation.fromJson(response.data);
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
