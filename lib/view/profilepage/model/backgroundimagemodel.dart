// To parse this JSON data, do
//
//     final profileBackGroundImageModel = profileBackGroundImageModelFromJson(jsonString);

import 'dart:convert';

ProfileBackGroundImageModel profileBackGroundImageModelFromJson(String str) =>
    ProfileBackGroundImageModel.fromJson(json.decode(str));

String profileBackGroundImageModelToJson(ProfileBackGroundImageModel data) =>
    json.encode(data.toJson());

class ProfileBackGroundImageModel {
  ProfileBackGroundImageModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory ProfileBackGroundImageModel.fromJson(Map<String, dynamic> json) =>
      ProfileBackGroundImageModel(
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
    this.profilebackimg,
    this.userid,
  });

  String? profilebackimg;
  String? userid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        profilebackimg: json["profilebackimg"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "profilebackimg": profilebackimg,
        "userid": userid,
      };
}
