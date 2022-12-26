// To parse this JSON data, do
//
//     final userPostListGetModel = userPostListGetModelFromJson(jsonString);

import 'dart:convert';

UserPostListGetModel userPostListGetModelFromJson(String str) =>
    UserPostListGetModel.fromJson(json.decode(str));

String userPostListGetModelToJson(UserPostListGetModel data) =>
    json.encode(data.toJson());

class UserPostListGetModel {
  UserPostListGetModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory UserPostListGetModel.fromJson(Map<String, dynamic> json) =>
      UserPostListGetModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.profileicon,
    this.username,
    this.addImagesOrVideos,
    this.posttype,
    this.liked,
    this.saved,
    this.postViewPersons,
  });

  String? profileicon;
  String? username;
  String? addImagesOrVideos;
  String? posttype;
  bool? liked;
  bool? saved;
  int? postViewPersons;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        profileicon: json["profileicon"],
        username: json["username"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        liked: json["liked"],
        saved: json["saved"],
        postViewPersons: json["postViewPersons"],
      );

  Map<String, dynamic> toJson() => {
        "profileicon": profileicon,
        "username": username,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "liked": liked,
        "saved": saved,
        "postViewPersons": postViewPersons,
      };
}
