// To parse this JSON data, do
//
//     final userPostListModel = userPostListModelFromJson(jsonString);

import 'dart:convert';

UserPostListModel userPostListModelFromJson(String str) =>
    UserPostListModel.fromJson(json.decode(str));

String userPostListModelToJson(UserPostListModel data) =>
    json.encode(data.toJson());

class UserPostListModel {
  UserPostListModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory UserPostListModel.fromJson(Map<String, dynamic> json) =>
      UserPostListModel(
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
    this.postid,
    this.indiviual,
    this.addImagesOrVideos,
    this.posttype,
    this.profileicon,
    this.username,
    this.description,
    this.likecount,
    this.postViewCount,
    this.liked,
    this.saved,
  });

  String? postid;
  bool? indiviual;
  String? addImagesOrVideos;
  String? posttype;
  String? profileicon;
  String? username;
  String? description;
  int? likecount;
  int? postViewCount;
  bool? liked;
  bool? saved;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        postid: json["postid"],
        indiviual: json["indiviual"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        profileicon: json["profileicon"],
        username: json["username"],
        description: json["description"],
        likecount: json["likecount"],
        postViewCount: json["postViewCount"],
        liked: json["liked"],
        saved: json["saved"],
      );

  Map<String, dynamic> toJson() => {
        "postid": postid,
        "indiviual": indiviual,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "profileicon": profileicon,
        "username": username,
        "description": description,
        "likecount": likecount,
        "postViewCount": postViewCount,
        "liked": liked,
        "saved": saved,
      };
}
