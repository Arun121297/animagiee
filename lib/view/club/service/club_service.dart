import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/club/models/club_request_list.dart';
import 'package:animagieeui/view/post/models/joined_club_model.dart';
import 'package:animagieeui/view/post/models/my_friends_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyClubService {
  //club join request
  Future clubJoinRequest({required clubId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"clubid": clubId};
    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(Urls.clubJoinRequest),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return data;
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //club accept request
  Future clubAcceptRequest({required requestId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"requestid": requestId};
    try {
      var response = await http.post(
        Uri.parse(Urls.clubAcceptRequest),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return data;
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //club reject request
  Future clubRejectrequest({required requestId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"requestid": requestId};
    try {
      var response = await http.post(
        Uri.parse(Urls.clubRejectRequest),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return data;
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //club delete
  Future deleteClub({required clubId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"clubid": clubId};
    try {
      var response = await http.post(
        Uri.parse(Urls.deleteClub),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return data;
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //leave from club
  Future leaveFromClub({required clubId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"clubid": clubId};
    try {
      var response = await http.post(
        Uri.parse(Urls.leaveFromClub),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return data;
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //club  request list
  Future<ClubRequestList?> clubJoinRequestList({required clubId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"clubid": clubId};
    try {
      var response = await http.post(
        Uri.parse(Urls.clubJoinRequestList),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Fluttertoast.showToast(msg: data["message"]);
        return clubRequestListFromJson(response.body);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
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
        // var jsonData = jsonDecode(response.body);
        // Fluttertoast.showToast(msg: jsonData['message']);
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
        // Get.back();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
