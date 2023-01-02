// To parse this JSON data, do
//
//     final myFriendsModel = myFriendsModelFromJson(jsonString);

import 'dart:convert';

MyFriendsModel myFriendsModelFromJson(String str) =>
    MyFriendsModel.fromJson(json.decode(str));

String myFriendsModelToJson(MyFriendsModel data) => json.encode(data.toJson());

class MyFriendsModel {
  MyFriendsModel({
    this.message,
    this.data,
  });

  String? message;
  List<MyFriendsDatum>? data;

  factory MyFriendsModel.fromJson(Map<String, dynamic> json) => MyFriendsModel(
        message: json["message"],
        data: List<MyFriendsDatum>.from(
            json["data"].map((x) => MyFriendsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MyFriendsDatum {
  MyFriendsDatum({
    this.username,
    this.id,
    this.profileicon,
  });

  String? username;
  String? id;
  String? profileicon;

  factory MyFriendsDatum.fromJson(Map<String, dynamic> json) => MyFriendsDatum(
        username: json["username"],
        id: json["_id"],
        profileicon: json["profileicon"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "_id": id,
        "profileicon": profileicon,
      };
}
