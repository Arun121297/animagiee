import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/instancepage/model/userProfile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constance.dart';
import '../../config/constant.dart';
import '../model/singlepostmodel.dart';

class SinglePostProfileSevice {
  static var client = http.Client();

  Future<SinglePostModel?> singlePostProfile({id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(Constant.authToken);

    var data = json.encode({"postid": id.toString()});
    try {
      // log("data-->$id");
      // log("token=$token");
      http.Response response = await http.post(Uri.parse(Urls.singlepost),
          body: data,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          });
      // log("data1-->$id");
      // log("token1=$token");
      // log("responce-->${response.body}");
      if (response.statusCode == 200) {
        log("body${response.body}");
        return singlePostModelFromJson(response.body);
      } else {
        // Fluttertost.msg(json.decode(response.body)['message']);
        log("${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("E$e");
      rethrow;
    }
  }
}
//  Future<SinglePostModel?> unAuthGetData({postId}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     String? token = prefs.getString(Constant.authToken);

//     String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
//     Map data = {"postId": postId};
//     try {
//       http.Response response = await http.post(
//         Uri.parse(baseUrl + Constant.unAuthSingleService),
//         body: data,
//       );
//       if (response.statusCode == 200) {
//         return singlePostDataModelFromJson(response.body);
//       } else {
//         ToastView.toast(json.decode(response.body)['message']);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }