// To parse this JSON data, do
//
//     final otherUserFollow = otherUserFollowFromJson(jsonString);

import 'dart:convert';

OtherUserFollow otherUserFollowFromJson(String str) =>
    OtherUserFollow.fromJson(json.decode(str));

String otherUserFollowToJson(OtherUserFollow data) =>
    json.encode(data.toJson());

class OtherUserFollow {
  OtherUserFollow({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory OtherUserFollow.fromJson(Map<String, dynamic> json) =>
      OtherUserFollow(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FollowerUser {
  FollowerUser({
    this.userid,
  });

  Datum? userid;

  factory FollowerUser.fromJson(Map<String, dynamic> json) => FollowerUser(
        userid: Datum.fromJson(json["userid"]),
      );

  Map<String, dynamic> toJson() => {
        "userid": userid!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.profileicon,
    this.username,
    this.followerUser,
  });

  String? id;
  String? profileicon;
  String? username;
  List<FollowerUser>? followerUser;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
        followerUser: json["followerUser"] == null
            ? null
            : List<FollowerUser>.from(
                json["followerUser"].map((x) => FollowerUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
        "followerUser": followerUser == null
            ? null
            : List<dynamic>.from(followerUser!.map((x) => x.toJson())),
      };
}
