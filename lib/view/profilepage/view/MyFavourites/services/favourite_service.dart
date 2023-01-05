import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/models/my_favourites_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteService {
  //get my favourite list
  Future<MyFavouritesModel?> getFavourite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    try {
      var response = await http.get(
        Uri.parse(Urls.favouriteList),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        return myFavouritesModelFromJson(response.body);
      } else {
        var jsonData = jsonDecode(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //add favourite
  Future addToFavourite({required postId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"postid": postId};
    try {
      var response = await http.post(Uri.parse(Urls.addFavourite),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: body);

      log(postId + "------" + response.body.toString());
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // return myFavouritesModelFromJson(response.body);
        // Fluttertoast.showToast(msg: jsonData['message']);
        return jsonData;
      } else {
        Fluttertoast.showToast(msg: jsonData['message']);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  //like unlike
  Future likeUnlike({required postId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"postid": postId};
    try {
      var response = await http.post(Uri.parse(Urls.likeUnlike),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: body);

      log(postId + "------" + response.body.toString());
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // return myFavouritesModelFromJson(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
        return jsonData;
      } else {
        Fluttertoast.showToast(msg: jsonData['message']);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  //block user
  Future blockUser({required userId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"blockPerson": userId};
    try {
      var response = await http.post(Uri.parse(Urls.blockUnblock),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: body);

      log(response.body.toString());
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // return myFavouritesModelFromJson(response.body);
        Fluttertoast.showToast(msg: jsonData['message']);
        return jsonData;
      } else {
        Fluttertoast.showToast(msg: jsonData['message']);
        // Get.back();
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
