// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.message,
    this.data1,
  });

  String? message;
  List<Data1>? data1;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        message: json["message"],
        data1: List<Data1>.from(json["data1"].map((x) => Data1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data1": List<dynamic>.from(data1!.map((x) => x.toJson())),
      };
}

class Data1 {
  Data1({
    this.followerUser,
    this.followingUser,
    this.profileicon,
    this.profilebackimg,
    this.username,
    this.about,
  });

  int? followerUser;
  int? followingUser;
  String? profileicon;
  String? profilebackimg;
  String? username;
  String? about;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        followerUser: json["followerUser"],
        followingUser: json["followingUser"],
        profileicon: json["profileicon"],
        profilebackimg: json["profilebackimg"],
        username: json["username"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        "followerUser": followerUser,
        "followingUser": followingUser,
        "profileicon": profileicon,
        "profilebackimg": profilebackimg,
        "username": username,
        "about": about,
      };
}
