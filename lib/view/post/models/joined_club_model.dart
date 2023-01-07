// To parse this JSON data, do
//
//     final joinedClubModel = joinedClubModelFromJson(jsonString);

import 'dart:convert';

JoinedClubModel joinedClubModelFromJson(String str) =>
    JoinedClubModel.fromJson(json.decode(str));

String joinedClubModelToJson(JoinedClubModel data) =>
    json.encode(data.toJson());

class JoinedClubModel {
  JoinedClubModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory JoinedClubModel.fromJson(Map<String, dynamic> json) =>
      JoinedClubModel(
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
    this.clubOwner,
  });

  String? clubicon;
  String? clubid;
  String? clubName;
  String? clubOwner;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clubicon: json["clubicon"],
        clubid: json["clubid"],
        clubName: json["clubName"],
        clubOwner: json["ClubOwner"],
      );

  Map<String, dynamic> toJson() => {
        "clubicon": clubicon,
        "clubid": clubid,
        "clubName": clubName,
        "ClubOwner": clubOwner,
      };
}
