// To parse this JSON data, do
//
//     final clubRequestList = clubRequestListFromJson(jsonString);

import 'dart:convert';

ClubRequestList clubRequestListFromJson(String str) =>
    ClubRequestList.fromJson(json.decode(str));

String clubRequestListToJson(ClubRequestList data) =>
    json.encode(data.toJson());

class ClubRequestList {
  ClubRequestList({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory ClubRequestList.fromJson(Map<String, dynamic> json) =>
      ClubRequestList(
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
    this.accepted,
    this.sendByuser,
    this.clubId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  bool? accepted;
  SendByuser? sendByuser;
  ClubId? clubId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        accepted: json["accepted"],
        sendByuser: SendByuser.fromJson(json["sendByuser"]),
        clubId: ClubId.fromJson(json["clubId"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "accepted": accepted,
        "sendByuser": sendByuser!.toJson(),
        "clubId": clubId!.toJson(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class ClubId {
  ClubId({
    this.id,
    this.clubicon,
    this.clubName,
  });

  String? id;
  String? clubicon;
  String? clubName;

  factory ClubId.fromJson(Map<String, dynamic> json) => ClubId(
        id: json["_id"],
        clubicon: json["clubicon"],
        clubName: json["ClubName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clubicon": clubicon,
        "ClubName": clubName,
      };
}

class SendByuser {
  SendByuser({
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory SendByuser.fromJson(Map<String, dynamic> json) => SendByuser(
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
