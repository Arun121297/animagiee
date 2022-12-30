// To parse this JSON data, do
//
//     final followRequestGetModel = followRequestGetModelFromJson(jsonString);

import 'dart:convert';

FollowRequestGetModel followRequestGetModelFromJson(String str) =>
    FollowRequestGetModel.fromJson(json.decode(str));

String followRequestGetModelToJson(FollowRequestGetModel data) =>
    json.encode(data.toJson());

class FollowRequestGetModel {
  FollowRequestGetModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory FollowRequestGetModel.fromJson(Map<String, dynamic> json) =>
      FollowRequestGetModel(
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
    this.requestSendTo,
    this.sendBy,
    this.accepted,
    this.typereq,
    this.common,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  RequestSendTo? requestSendTo;
  SendBy? sendBy;
  bool? accepted;
  String? typereq;
  String? common;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        requestSendTo: RequestSendTo.fromJson(json["requestSendTo"]),
        sendBy: SendBy.fromJson(json["sendBy"]),
        accepted: json["accepted"],
        typereq: json["typereq"],
        common: json["common"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "requestSendTo": requestSendTo!.toJson(),
        "sendBy": sendBy!.toJson(),
        "accepted": accepted,
        "typereq": typereq,
        "common": common,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class RequestSendTo {
  RequestSendTo({
    this.id,
  });

  String? id;

  factory RequestSendTo.fromJson(Map<String, dynamic> json) => RequestSendTo(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class SendBy {
  SendBy({
    this.id,
    this.profileicon,
    this.username,
    this.isPrivate,
  });

  String? id;
  String? profileicon;
  String? username;
  bool? isPrivate;

  factory SendBy.fromJson(Map<String, dynamic> json) => SendBy(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
        isPrivate: json["isPrivate"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
        "isPrivate": isPrivate,
      };
}
