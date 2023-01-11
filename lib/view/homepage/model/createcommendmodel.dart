// To parse this JSON data, do
//
//     final createCommendmodel = createCommendmodelFromJson(jsonString);

import 'dart:convert';

CreateCommendmodel? createCommendmodelFromJson(String str) =>
    CreateCommendmodel.fromJson(json.decode(str));

String createCommendmodelToJson(CreateCommendmodel? data) =>
    json.encode(data!.toJson());

class CreateCommendmodel {
  CreateCommendmodel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory CreateCommendmodel.fromJson(Map<String, dynamic> json) =>
      CreateCommendmodel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.postid,
    this.commandword,
    this.makeBy,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? postid;
  String? commandword;
  String? makeBy;
  bool? isActive;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        postid: json["postid"],
        commandword: json["commandword"],
        makeBy: json["makeBy"],
        isActive: json["isActive"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "postid": postid,
        "commandword": commandword,
        "makeBy": makeBy,
        "isActive": isActive,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
