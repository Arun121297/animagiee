// To parse this JSON data, do
//
//     final followRequestModel = followRequestModelFromJson(jsonString);

import 'dart:convert';

FollowRequestModel followRequestModelFromJson(String str) =>
    FollowRequestModel.fromJson(json.decode(str));

String followRequestModelToJson(FollowRequestModel data) =>
    json.encode(data.toJson());

class FollowRequestModel {
  FollowRequestModel({
    this.message,
  });

  String? message;

  factory FollowRequestModel.fromJson(Map<String, dynamic> json) =>
      FollowRequestModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
