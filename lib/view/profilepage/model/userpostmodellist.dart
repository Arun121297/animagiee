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
  Username? username;
  String? addImagesOrVideos;
  Posttype? posttype;
  int? likeCount;
  int? cmdCount;
  bool? liked;
  bool? saved;
  int? postViewPersons;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        description: json["description"] == null ? null : json["description"],
        postid: json["postid"],
        profileicon: json["profileicon"],
        username: usernameValues.map![json["username"]],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: posttypeValues.map![json["posttype"]],
        likeCount: json["likeCount"],
        cmdCount: json["cmdCount"],
        liked: json["liked"],
        saved: json["saved"],
        postViewPersons: json["postViewPersons"],
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "postid": postid,
        "profileicon": profileicon,
        "username": usernameValues.reverse[username],
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttypeValues.reverse[posttype],
        "likeCount": likeCount,
        "cmdCount": cmdCount,
        "liked": liked,
        "saved": saved,
        "postViewPersons": postViewPersons,
      };
}

enum Posttype { IMAGE, VIDEO }

final posttypeValues =
    EnumValues({"image": Posttype.IMAGE, "video": Posttype.VIDEO});

enum Username { ARUN_NK121297_GMAIL_COM }

final usernameValues =
    EnumValues({"arun.nk121297@gmail.com": Username.ARUN_NK121297_GMAIL_COM});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
