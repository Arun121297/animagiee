// To parse this JSON data, do
//
//     final singlePostModel = singlePostModelFromJson(jsonString);

import 'dart:convert';

SinglePostModel singlePostModelFromJson(String str) =>
    SinglePostModel.fromJson(json.decode(str));

String singlePostModelToJson(SinglePostModel data) =>
    json.encode(data.toJson());

class SinglePostModel {
  SinglePostModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory SinglePostModel.fromJson(Map<String, dynamic> json) =>
      SinglePostModel(
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
  Postowner? postowner;
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
        postowner: Postowner.fromJson(json["postowner"]),
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
        "postowner": postowner!.toJson(),
        "profileicon": profileicon,
        "username": username,
        "description": description,
        "likecount": likecount,
        "postViewCount": postViewCount,
        "liked": liked,
        "saved": saved,
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
