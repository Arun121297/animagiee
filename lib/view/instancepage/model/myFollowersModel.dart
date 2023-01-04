// To parse this JSON data, do
//
//     final myFollowers = myFollowersFromJson(jsonString);

import 'dart:convert';

MyFollowers myFollowersFromJson(String str) =>
    MyFollowers.fromJson(json.decode(str));

String myFollowersToJson(MyFollowers data) => json.encode(data.toJson());

class MyFollowers {
  MyFollowers({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory MyFollowers.fromJson(Map<String, dynamic> json) => MyFollowers(
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
