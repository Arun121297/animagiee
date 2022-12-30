// To parse this JSON data, do
//
//     final myFollowerUser = myFollowerUserFromJson(jsonString);

import 'dart:convert';

MyFollowerUser myFollowerUserFromJson(String str) =>
    MyFollowerUser.fromJson(json.decode(str));

String myFollowerUserToJson(MyFollowerUser data) => json.encode(data.toJson());

class MyFollowerUser {
  MyFollowerUser({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory MyFollowerUser.fromJson(Map<String, dynamic> json) => MyFollowerUser(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FollowingUser {
  FollowingUser({
    this.userid,
  });

  Datum? userid;

  factory FollowingUser.fromJson(Map<String, dynamic> json) => FollowingUser(
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
    this.followingUser,
  });

  String? id;
  String? profileicon;
  String? username;
  List<FollowingUser>? followingUser;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
        followingUser: json["followingUser"] == null
            ? null
            : List<FollowingUser>.from(
                json["followingUser"].map((x) => FollowingUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
        "followingUser": followingUser == null
            ? null
            : List<dynamic>.from(followingUser!.map((x) => x.toJson())),
      };
}
