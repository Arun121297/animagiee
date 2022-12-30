// To parse this JSON data, do
//
//     final deleteFollowRequest = deleteFollowRequestFromJson(jsonString);

import 'dart:convert';

DeleteFollowRequest deleteFollowRequestFromJson(String str) =>
    DeleteFollowRequest.fromJson(json.decode(str));

String deleteFollowRequestToJson(DeleteFollowRequest data) =>
    json.encode(data.toJson());

class DeleteFollowRequest {
  DeleteFollowRequest({
    this.message,
  });

  String? message;

  factory DeleteFollowRequest.fromJson(Map<String, dynamic> json) =>
      DeleteFollowRequest(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
