// To parse this JSON data, do
//
//     final confirmFollowRequest = confirmFollowRequestFromJson(jsonString);

import 'dart:convert';

ConfirmFollowRequest confirmFollowRequestFromJson(String str) =>
    ConfirmFollowRequest.fromJson(json.decode(str));

String confirmFollowRequestToJson(ConfirmFollowRequest data) =>
    json.encode(data.toJson());

class ConfirmFollowRequest {
  ConfirmFollowRequest({
    this.message,
  });

  String? message;

  factory ConfirmFollowRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmFollowRequest(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
