// To parse this JSON data, do
//
//     final userPostModelList = userPostModelListFromJson(jsonString);

import 'dart:convert';

UserPostModelList userPostModelListFromJson(String str) =>
    UserPostModelList.fromJson(json.decode(str));

String userPostModelListToJson(UserPostModelList data) =>
    json.encode(data.toJson());

class UserPostModelList {
  UserPostModelList({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory UserPostModelList.fromJson(Map<String, dynamic> json) =>
      UserPostModelList(
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
    this.description,
    this.postid,
    this.profileicon,
    this.username,
    this.addImagesOrVideos,
    this.posttype,
    this.likeCount,
    this.cmdCount,
    this.liked,
    this.saved,
    this.postViewPersons,
  });

  String? description;
  String? postid;
  String? profileicon;
  String? username;
  String? addImagesOrVideos;
  String? posttype;
  int? likeCount;
  int? cmdCount;
  bool? liked;
  bool? saved;
  int? postViewPersons;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        description: json["description"],
        postid: json["postid"],
        profileicon: json["profileicon"],
        username: json["username"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        likeCount: json["likeCount"],
        cmdCount: json["cmdCount"],
        liked: json["liked"],
        saved: json["saved"],
        postViewPersons: json["postViewPersons"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "postid": postid,
        "profileicon": profileicon,
        "username": username,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "likeCount": likeCount,
        "cmdCount": cmdCount,
        "liked": liked,
        "saved": saved,
        "postViewPersons": postViewPersons,
      };
}
