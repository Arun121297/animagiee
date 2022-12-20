// To parse this JSON data, do
//
//     final clubCreationModel = clubCreationModelFromJson(jsonString);

import 'dart:convert';

ClubCreationModel clubCreationModelFromJson(String str) =>
    ClubCreationModel.fromJson(json.decode(str));

String clubCreationModelToJson(ClubCreationModel data) =>
    json.encode(data.toJson());

class ClubCreationModel {
  ClubCreationModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory ClubCreationModel.fromJson(Map<String, dynamic> json) =>
      ClubCreationModel(
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
    this.makeBy,
    this.clubicon,
    this.clubName,
    this.clubDescription,
    this.community,
    this.communityTypeisPrivate,
    this.interestedclub,
    this.communitypersons,
    this.isActive,
    this.accepted,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? makeBy;
  String? clubicon;
  String? clubName;
  String? clubDescription;
  String? community;
  bool? communityTypeisPrivate;
  List<dynamic>? interestedclub;
  List<String>? communitypersons;
  bool? isActive;
  bool? accepted;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        makeBy: json["makeBy"],
        clubicon: json["clubicon"],
        clubName: json["ClubName"],
        clubDescription: json["ClubDescription"],
        community: json["Community"],
        communityTypeisPrivate: json["CommunityTypeisPrivate"],
        interestedclub:
            List<dynamic>.from(json["interestedclub"].map((x) => x)),
        communitypersons:
            List<String>.from(json["communitypersons"].map((x) => x)),
        isActive: json["isActive"],
        accepted: json["accepted"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "makeBy": makeBy,
        "clubicon": clubicon,
        "ClubName": clubName,
        "ClubDescription": clubDescription,
        "Community": community,
        "CommunityTypeisPrivate": communityTypeisPrivate,
        "interestedclub": List<dynamic>.from(interestedclub!.map((x) => x)),
        "communitypersons": List<dynamic>.from(communitypersons!.map((x) => x)),
        "isActive": isActive,
        "accepted": accepted,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
