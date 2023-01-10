import 'dart:convert';
import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/view/comment/models/add_post_comment_model.dart';
import 'package:animagieeui/view/comment/models/post_comment_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CommentService {
  //post comment list
  Future<PostCommentModel?> getComment({required postId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {"postid": postId};
    try {
      var response = await http.post(
        Uri.parse(Urls.commentList),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Fluttertoast.showToast(msg: data["message"]);
        return postCommentModelFromJson(response.body);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

//add post comment
  Future<AddPostCommentModel?> addComment(
      {required postId, required comment}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(Constant.authToken);
    var body = {
      "postid": postId,
      "commandword": comment,
    };
    try {
      var response = await http.post(
        Uri.parse(Urls.addComment),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Fluttertoast.showToast(msg: data["message"]);
        return addPostCommentModelFromJson(response.body);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
