// To parse this JSON data, do
//
//     final deletcommentmodel = deletcommentmodelFromJson(jsonString);

import 'dart:convert';

Deletcommentmodel? deletcommentmodelFromJson(String str) =>
    Deletcommentmodel.fromJson(json.decode(str));

String deletcommentmodelToJson(Deletcommentmodel? data) =>
    json.encode(data!.toJson());

class Deletcommentmodel {
  Deletcommentmodel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory Deletcommentmodel.fromJson(Map<String, dynamic> json) =>
      Deletcommentmodel(
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
    this.id,
    this.postid,
    this.commandword,
    this.makeBy,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? postid;
  String? commandword;
  String? makeBy;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        postid: json["postid"],
        commandword: json["commandword"],
        makeBy: json["makeBy"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "postid": postid,
        "commandword": commandword,
        "makeBy": makeBy,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
