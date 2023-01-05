// To parse this JSON data, do
//
//     final otherUserFollowing = otherUserFollowingFromJson(jsonString);

import 'dart:convert';

OtherUserFollowingModel otherUserFollowingModelFromJson(String str) =>
    OtherUserFollowingModel.fromJson(json.decode(str));

String otherUserFollowingModelToJson(OtherUserFollowingModel data) =>
    json.encode(data.toJson());

class OtherUserFollowingModel {
  OtherUserFollowingModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory OtherUserFollowingModel.fromJson(Map<String, dynamic> json) =>
      OtherUserFollowingModel(
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
    this.userId,
    this.profileImage,
    this.username,
    this.requestid2,
  });

  String? userId;
  String? profileImage;
  String? username;
  List<Requestid2>? requestid2;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userID"],
        profileImage: json["ProfileImage"],
        username: json["Username"],
        requestid2: List<Requestid2>.from(
            json["requestid2"].map((x) => Requestid2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "ProfileImage": profileImage,
        "Username": username,
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
