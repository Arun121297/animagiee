// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel? userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel? data) =>
    json.encode(data!.toJson());

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
    this.blocked,
    this.requestid2,
  });

  int? followerUser;
  int? followingUser;
  String? profileicon;
  String? profilebackimg;
  String? username;
  String? about;
  bool? blocked;
  List<Requestid2>? requestid2;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        followerUser: json["followerUser"],
        followingUser: json["followingUser"],
        profileicon: json["profileicon"],
        profilebackimg: json["profilebackimg"],
        username: json["username"],
        about: json["about"],
        blocked: json["Blocked"],
        requestid2: List<Requestid2>.from(
            json["requestid2"].map((x) => Requestid2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "followerUser": followerUser,
        "followingUser": followingUser,
        "profileicon": profileicon,
        "profilebackimg": profilebackimg,
        "username": username,
        "about": about,
        "Blocked": blocked,
        "requestid2": List<dynamic>.from(requestid2!.map((x) => x.toJson())),
      };
}

class Requestid2 {
  Requestid2({
    this.requestId,
    this.status,
  });

  String? requestId;
  bool? status;

  factory Requestid2.fromJson(Map<String, dynamic> json) => Requestid2(
        requestId: json["requestId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "status": status,
      };
}
