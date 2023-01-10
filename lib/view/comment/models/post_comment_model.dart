// To parse this JSON data, do
//
//     final postCommentModel = postCommentModelFromJson(jsonString);

import 'dart:convert';

PostCommentModel? postCommentModelFromJson(String str) =>
    PostCommentModel.fromJson(json.decode(str));

String postCommentModelToJson(PostCommentModel? data) =>
    json.encode(data!.toJson());

class PostCommentModel {
  PostCommentModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum?>? data;

  factory PostCommentModel.fromJson(Map<String, dynamic> json) =>
      PostCommentModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.isActive,
    this.id,
    this.postid,
    this.makeBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commandword,
  });

  bool? isActive;
  String? id;
  Postid? postid;
  MakeBy? makeBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? commandword;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isActive: json["isActive"],
        id: json["_id"],
        postid: Postid.fromJson(json["postid"]),
        makeBy: MakeBy.fromJson(json["makeBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        commandword: json["commandword"],
      );

  Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "_id": id,
        "postid": postid!.toJson(),
        "makeBy": makeBy!.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "commandword": commandword,
      };
}

class MakeBy {
  MakeBy({
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory MakeBy.fromJson(Map<String, dynamic> json) => MakeBy(
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

class Postid {
  Postid({
    this.id,
  });

  String? id;

  factory Postid.fromJson(Map<String, dynamic> json) => Postid(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
