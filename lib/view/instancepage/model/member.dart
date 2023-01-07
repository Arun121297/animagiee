// To parse this JSON data, do
//
//     final clubMembersModel = clubMembersModelFromJson(jsonString);

import 'dart:convert';

ClubMembersModel? clubMembersModelFromJson(String str) =>
    ClubMembersModel.fromJson(json.decode(str));

String clubMembersModelToJson(ClubMembersModel? data) =>
    json.encode(data!.toJson());

class ClubMembersModel {
  ClubMembersModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum?>? data;

  factory ClubMembersModel.fromJson(Map<String, dynamic> json) =>
      ClubMembersModel(
        message: json["message"],
        data: List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.userid,
    this.profileicon,
    this.username,
    this.requestid2,
  });

  String? userid;
  String? profileicon;
  String? username;
  List<Requestid2?>? requestid2;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userid: json["userid"],
        profileicon: json["profileicon"],
        username: json["username"],
        requestid2: List<Requestid2?>.from(
            json["requestid2"]!.map((x) => Requestid2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "profileicon": profileicon,
        "username": username,
        "requestid2": List<dynamic>.from(requestid2!.map((x) => x!.toJson())),
      };
}

class Requestid2 {
  Requestid2({
    this.requestId,
    this.status,
  });

  String? requestId;
  bool? status;

  factory Requestid2.fromJson(Map<String, dynamic> json) => Requestid2(
        requestId: json["requestId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "status": status,
      };
}
