// To parse this JSON data, do
//
//     final editClubbgiconModel = editClubbgiconModelFromJson(jsonString);

import 'dart:convert';

EditClubbgiconModel? editClubbgiconModelFromJson(String str) =>
    EditClubbgiconModel.fromJson(json.decode(str));

String editClubbgiconModelToJson(EditClubbgiconModel? data) =>
    json.encode(data!.toJson());

class EditClubbgiconModel {
  EditClubbgiconModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory EditClubbgiconModel.fromJson(Map<String, dynamic> json) =>
      EditClubbgiconModel(
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
    this.clubDescription,
    this.communityTypeisPrivate,
    this.interestedclub,
    this.communitypersons,
    this.isActive,
    this.accepted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.community,
    this.groupName,
    this.clubbgicon,
  });

  String? id;
  String? makeBy;
  String? clubicon;
  String? clubName;
  String? clubDescription;
  bool? communityTypeisPrivate;
  List<dynamic>? interestedclub;
  List<String?>? communitypersons;
  bool? isActive;
  bool? accepted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? community;
  String? groupName;
  String? clubbgicon;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        makeBy: json["makeBy"],
        clubicon: json["clubicon"],
        clubName: json["ClubName"],
        clubDescription: json["ClubDescription"],
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
        community: json["Community"],
        groupName: json["groupName"],
        clubbgicon: json["clubbgicon"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "makeBy": makeBy,
        "clubicon": clubicon,
        "ClubName": clubName,
        "ClubDescription": clubDescription,
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
        "Community": community,
        "groupName": groupName,
        "clubbgicon": clubbgicon,
      };
}
