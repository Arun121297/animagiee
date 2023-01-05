// To parse this JSON data, do
//
//     final communityProfileModel = communityProfileModelFromJson(jsonString);

import 'dart:convert';

CommunityProfileModel communityProfileModelFromJson(String str) =>
    CommunityProfileModel.fromJson(json.decode(str));

String communityProfileModelToJson(CommunityProfileModel data) =>
    json.encode(data.toJson());

class CommunityProfileModel {
  CommunityProfileModel({
    this.message,
    this.data1,
  });

  String? message;
  List<Data1>? data1;

  factory CommunityProfileModel.fromJson(Map<String, dynamic> json) =>
      CommunityProfileModel(
        message: json["message"],
        data1: List<Data1>.from(json["data1"].map((x) => Data1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data1": List<dynamic>.from(data1!.map((x) => x.toJson())),
      };
}

class Data1 {
  Data1({
    this.clubid,
    this.clubOwner,
    this.communitypersons,
    this.clubicon,
    this.clubbgicon,
    this.clubName,
    this.clubDescription,
  });

  String? clubid;
  String? clubOwner;
  int? communitypersons;
  String? clubicon;
  String? clubbgicon;
  String? clubName;
  String? clubDescription;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        clubid: json["clubid"],
        clubOwner: json["clubOwner"],
        communitypersons: json["communitypersons"],
        clubicon: json["clubicon"],
        clubbgicon: json["clubbgicon"],
        clubName: json["ClubName"],
        clubDescription: json["ClubDescription"],
      );

  Map<String, dynamic> toJson() => {
        "clubid": clubid,
        "clubOwner": clubOwner,
        "communitypersons": communitypersons,
        "clubicon": clubicon,
        "clubbgicon": clubbgicon,
        "ClubName": clubName,
        "ClubDescription": clubDescription,
      };
}
