// To parse this JSON data, do
//
//     final commentlistmodel = commentlistmodelFromJson(jsonString);

import 'dart:convert';

Commentlistmodel? commentlistmodelFromJson(String str) =>
    Commentlistmodel.fromJson(json.decode(str));

String commentlistmodelToJson(Commentlistmodel? data) =>
    json.encode(data!.toJson());

class Commentlistmodel {
  Commentlistmodel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum?>? data;

  factory Commentlistmodel.fromJson(Map<String, dynamic> json) =>
      Commentlistmodel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
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
  Postid? postid;
  String? commandword;
  MakeBy? makeBy;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        postid: Postid.fromJson(json["postid"]),
        commandword: json["commandword"],
        makeBy: MakeBy.fromJson(json["makeBy"]),
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "postid": postid!.toJson(),
        "commandword": commandword,
        "makeBy": makeBy!.toJson(),
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class MakeBy {
  MakeBy({
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory MakeBy.fromJson(Map<String, dynamic> json) => MakeBy(
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

class Postid {
  Postid({
    this.id,
  });

  String? id;

  factory Postid.fromJson(Map<String, dynamic> json) => Postid(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
