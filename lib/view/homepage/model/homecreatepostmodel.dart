// To parse this JSON data, do
//
//     final homeCreatePostModel = homeCreatePostModelFromJson(jsonString);

import 'dart:convert';

HomeCreatePostModel homeCreatePostModelFromJson(String str) =>
    HomeCreatePostModel.fromJson(json.decode(str));

String homeCreatePostModelToJson(HomeCreatePostModel data) =>
    json.encode(data.toJson());

class HomeCreatePostModel {
  HomeCreatePostModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory HomeCreatePostModel.fromJson(Map<String, dynamic> json) =>
      HomeCreatePostModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.postowner,
    this.addImagesOrVideos,
    this.posttype,
    this.like,
    this.description,
    this.tagPeople,
    this.indiviual,
    this.club,
    this.id,
    this.postLike,
    this.saved,
    this.postViewPersons,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? postowner;
  String? addImagesOrVideos;
  String? posttype;
  List<dynamic>? like;
  String? description;
  List<String>? tagPeople;
  bool? indiviual;
  List<String>? club;
  String? id;
  List<dynamic>? postLike;
  List<dynamic>? saved;
  List<dynamic>? postViewPersons;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        postowner: json["postowner"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        like: List<dynamic>.from(json["like"].map((x) => x)),
        description: json["description"],
        tagPeople: List<String>.from(json["tagPeople"].map((x) => x)),
        indiviual: json["indiviual"],
        club: List<String>.from(json["club"].map((x) => x)),
        id: json["_id"],
        postLike: List<dynamic>.from(json["postLike"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        postViewPersons:
            List<dynamic>.from(json["postViewPersons"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "postowner": postowner,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "like": List<dynamic>.from(like!.map((x) => x)),
        "description": description,
        "tagPeople": List<dynamic>.from(tagPeople!.map((x) => x)),
        "indiviual": indiviual,
        "club": List<dynamic>.from(club!.map((x) => x)),
        "_id": id,
        "postLike": List<dynamic>.from(postLike!.map((x) => x)),
        "saved": List<dynamic>.from(saved!.map((x) => x)),
        "postViewPersons": List<dynamic>.from(postViewPersons!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
