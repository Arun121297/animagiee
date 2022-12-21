// To parse this JSON data, do
//
//     final clubCreation = clubCreationFromJson(jsonString);

import 'dart:convert';

ClubCreation clubCreationFromJson(String str) =>
    ClubCreation.fromJson(json.decode(str));

String clubCreationToJson(ClubCreation data) => json.encode(data.toJson());

class ClubCreation {
  ClubCreation({
    this.message,
    this.data,
  });

  String? message;
  String? data;

  factory ClubCreation.fromJson(Map<String, dynamic> json) => ClubCreation(
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data,
      };
}
