// To parse this JSON data, do
//
//     final communitiUserListModel = communitiUserListModelFromJson(jsonString);

import 'dart:convert';

CommunitiUserListModel communitiUserListModelFromJson(String str) =>
    CommunitiUserListModel.fromJson(json.decode(str));

String communitiUserListModelToJson(CommunitiUserListModel data) =>
    json.encode(data.toJson());

class CommunitiUserListModel {
  CommunitiUserListModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory CommunitiUserListModel.fromJson(Map<String, dynamic> json) =>
      CommunitiUserListModel(
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
    this.clubicon,
    this.clubid,
    this.clubName,
  });

  String? clubicon;
  String? clubid;
  String? clubName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clubicon: json["clubicon"],
        clubid: json["clubid"],
        clubName: json["clubName"],
      );

  Map<String, dynamic> toJson() => {
        "clubicon": clubicon,
        "clubid": clubid,
        "clubName": clubName,
      };
}
