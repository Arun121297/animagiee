// To parse this JSON data, do
//
//     final editClubModel = editClubModelFromJson(jsonString);

import 'dart:convert';

EditClubModel? editClubModelFromJson(String str) =>
    EditClubModel.fromJson(json.decode(str));

String editClubModelToJson(EditClubModel? data) => json.encode(data!.toJson());

class EditClubModel {
  EditClubModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory EditClubModel.fromJson(Map<String, dynamic> json) => EditClubModel(
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
    this.makeBy,
    this.clubicon,
    this.clubName,
    this.groupName,
    this.clubDescription,
    this.community,
    this.communityTypeisPrivate,
    this.interestedclub,
    this.communitypersons,
    this.isActive,
    this.accepted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? makeBy;
  String? clubicon;
  String? clubName;
  String? groupName;
  String? clubDescription;
  String? community;
  bool? communityTypeisPrivate;
  List<dynamic>? interestedclub;
  List<String?>? communitypersons;
  bool? isActive;
  bool? accepted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        makeBy: json["makeBy"],
        clubicon: json["clubicon"],
        clubName: json["ClubName"],
        groupName: json["groupName"],
        clubDescription: json["ClubDescription"],
        community: json["Community"],
        communityTypeisPrivate: json["CommunityTypeisPrivate"],
        interestedclub: json["interestedclub"] == null
            ? []
            : List<dynamic>.from(json["interestedclub"]!.map((x) => x)),
        communitypersons: json["communitypersons"] == null
            ? []
            : List<String?>.from(json["communitypersons"]!.map((x) => x)),
        isActive: json["isActive"],
        accepted: json["accepted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "makeBy": makeBy,
        "clubicon": clubicon,
        "ClubName": clubName,
        "groupName": groupName,
        "ClubDescription": clubDescription,
        "Community": community,
        "CommunityTypeisPrivate": communityTypeisPrivate,
        "interestedclub": interestedclub == null
            ? []
            : List<dynamic>.from(interestedclub!.map((x) => x)),
        "communitypersons": communitypersons == null
            ? []
            : List<dynamic>.from(communitypersons!.map((x) => x)),
        "isActive": isActive,
        "accepted": accepted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
