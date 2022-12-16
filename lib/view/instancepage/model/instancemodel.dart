// To parse this JSON data, do
//
//     final communitiesList = communitiesListFromJson(jsonString);

import 'dart:convert';

CommunitiesList communitiesListFromJson(String str) =>
    CommunitiesList.fromJson(json.decode(str));

String communitiesListToJson(CommunitiesList data) =>
    json.encode(data.toJson());

class CommunitiesList {
  CommunitiesList({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory CommunitiesList.fromJson(Map<String, dynamic> json) =>
      CommunitiesList(
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
    this.makeby,
    this.imageUrl,
    this.communityName,
    this.communityPersons,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? makeby;
  String? imageUrl;
  String? communityName;
  List<dynamic>? communityPersons;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        makeby: json["makeby"],
        imageUrl: json["imageUrl"],
        communityName: json["communityName"],
        communityPersons:
            List<dynamic>.from(json["communityPersons"].map((x) => x)),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "makeby": makeby,
        "imageUrl": imageUrl,
        "communityName": communityName,
        "communityPersons": List<dynamic>.from(communityPersons!.map((x) => x)),
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
