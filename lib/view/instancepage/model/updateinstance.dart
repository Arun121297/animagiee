// To parse this JSON data, do
//
//     final  = updateInstanceModelFromJson(jsonString);

import 'dart:convert';

UpdateInstanceModel updateInstanceModelFromJson(String str) =>
    UpdateInstanceModel.fromJson(json.decode(str));

String ToJson(UpdateInstanceModel data) => json.encode(data.toJson());

class UpdateInstanceModel {
  UpdateInstanceModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory UpdateInstanceModel.fromJson(Map<String, dynamic> json) =>
      UpdateInstanceModel(
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
    this.profileicon,
    this.profilebackimg,
    this.workwithus,
    this.emailorphone,
    this.username,
    this.about,
    this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.email,
    this.mobNo,
    this.address,
    this.pinCode,
    this.interestedCommunities,
    this.followingUser,
    this.followerUser,
    this.accActivate,
    this.accDelete,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? profileicon;
  String? profilebackimg;
  bool? workwithus;
  String? emailorphone;
  String? username;
  String? about;
  String? password;
  String? firstName;
  String? lastName;
  String? gender;
  dynamic dob;
  String? email;
  dynamic mobNo;
  String? address;
  dynamic pinCode;
  List<String>? interestedCommunities;
  List<dynamic>? followingUser;
  List<dynamic>? followerUser;
  bool? accActivate;
  bool? accDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        profileicon: json["profileicon"],
        profilebackimg: json["profilebackimg"],
        workwithus: json["workwithus"],
        emailorphone: json["emailorphone"],
        username: json["username"],
        about: json["about"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dob: json["dob"],
        email: json["email"],
        mobNo: json["mobNo"],
        address: json["address"],
        pinCode: json["pinCode"],
        interestedCommunities:
            List<String>.from(json["interestedCommunities"].map((x) => x)),
        followingUser: List<dynamic>.from(json["followingUser"].map((x) => x)),
        followerUser: List<dynamic>.from(json["followerUser"].map((x) => x)),
        accActivate: json["accActivate"],
        accDelete: json["accDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "profilebackimg": profilebackimg,
        "workwithus": workwithus,
        "emailorphone": emailorphone,
        "username": username,
        "about": about,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "dob": dob,
        "email": email,
        "mobNo": mobNo,
        "address": address,
        "pinCode": pinCode,
        "interestedCommunities":
            List<dynamic>.from(interestedCommunities!.map((x) => x)),
        "followingUser": List<dynamic>.from(followingUser!.map((x) => x)),
        "followerUser": List<dynamic>.from(followerUser!.map((x) => x)),
        "accActivate": accActivate,
        "accDelete": accDelete,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
