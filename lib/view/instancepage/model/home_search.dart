// To parse this JSON data, do
//
//     final homeSearchModel = homeSearchModelFromJson(jsonString);

import 'dart:convert';

HomeSearchModel homeSearchModelFromJson(String str) =>
    HomeSearchModel.fromJson(json.decode(str));

String homeSearchModelToJson(HomeSearchModel data) =>
    json.encode(data.toJson());

class HomeSearchModel {
  HomeSearchModel({
    this.message,
    this.data,
    this.post,
  });

  String? message;
  List<Datum>? data;
  List<dynamic>? post;

  factory HomeSearchModel.fromJson(Map<String, dynamic> json) =>
      HomeSearchModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        post: List<dynamic>.from(json["post"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "post": List<dynamic>.from(post!.map((x) => x)),
      };
}

class Datum {
  Datum({
    this.isPrivate,
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

  bool? isPrivate;
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isPrivate: json["isPrivate"],
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
        "isPrivate": isPrivate,
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
