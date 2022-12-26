// To parse this JSON data, do
//
//     final suggestedFriendList = suggestedFriendListFromJson(jsonString);

import 'dart:convert';

SuggestedFriendList suggestedFriendListFromJson(String str) =>
    SuggestedFriendList.fromJson(json.decode(str));

String suggestedFriendListToJson(SuggestedFriendList data) =>
    json.encode(data.toJson());

class SuggestedFriendList {
  SuggestedFriendList({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory SuggestedFriendList.fromJson(Map<String, dynamic> json) =>
      SuggestedFriendList(
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
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
      };
}
