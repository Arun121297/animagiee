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
    this.postowner,
    this.username,
    this.description,
    this.likecount,
    this.cmdCount,
    this.postViewCount,
    this.liked,
    this.saved,
    this.blocked,
    this.clubownerId,
  });

  String? postid;
  bool? indiviual;
  String? addImagesOrVideos;
  String? posttype;
  Postowner? postowner;
  String? description;
  int? likecount;
  String? username;
  int? cmdCount;
  int? postViewCount;
  bool? liked;
  bool? saved;
  bool? blocked;
  String? clubownerId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        postid: json["postid"] ?? "",
        indiviual: json["indiviual"],
        addImagesOrVideos: json["addImagesOrVideos"] ?? "",
        posttype: json["posttype"] ?? "",
        username: json["username"] ?? "",
        clubownerId: json["clubownerId"] ?? "",
        postowner: Postowner.fromJson(json["postowner"]),
        description: json["description"] ?? "",
        likecount: json["likecount"] ?? 0,
        cmdCount: json["cmdCount"] ?? 0,
        postViewCount: json["postViewCount"] ?? 0,
        liked: json["liked"],
        saved: json["saved"],
        blocked: json["Blocked"],
      );

  Map<String, dynamic> toJson() => {
        "postid": postid,
        "indiviual": indiviual,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "postowner": postowner!.toJson(),
        "description": description,
        "likecount": likecount,
        "cmdCount": cmdCount,
        "username": username,
        "clubownerId": clubownerId,
        "postViewCount": postViewCount,
        "liked": liked,
        "saved": saved,
        "Blocked": blocked,
      };
}

class Postowner {
  Postowner({
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory Postowner.fromJson(Map<String, dynamic> json) => Postowner(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
      };
}
