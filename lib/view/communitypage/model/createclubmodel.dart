// To parse this JSON data, do
//
//     final createdClubModel = createdClubModelFromJson(jsonString);

import 'dart:convert';

CreatedClubModel createdClubModelFromJson(String str) =>
    CreatedClubModel.fromJson(json.decode(str));

String createdClubModelToJson(CreatedClubModel data) =>
    json.encode(data.toJson());

class CreatedClubModel {
  CreatedClubModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory CreatedClubModel.fromJson(Map<String, dynamic> json) =>
      CreatedClubModel(
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
    this.clubName,
  });

  String? clubicon;
  String? clubName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clubicon: json["clubicon"],
        clubName: json["clubName"],
      );

  Map<String, dynamic> toJson() => {
        "clubicon": clubicon,
        "clubName": clubName,
      };
}
