// // To parse this JSON data, do
// //
// //     final communitieSelectedList = communitieSelectedListFromJson(jsonString);

// import 'dart:convert';

// CommunitieSelectedList communitieSelectedListFromJson(String str) =>
//     CommunitieSelectedList.fromJson(json.decode(str));

// String communitieSelectedListToJson(CommunitieSelectedList data) =>
//     json.encode(data.toJson());

// class CommunitieSelectedList {
//   CommunitieSelectedList({
//     this.message,
//     this.data,
//   });

//   String? message;
//   List<Datum>? data;

//   factory CommunitieSelectedList.fromJson(Map<String, dynamic> json) =>
//       CommunitieSelectedList(
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     this.id,
//     this.emailorphone,
//     this.username,
//     this.interestedCommunities,
//   });

//   String? id;
//   String? emailorphone;
//   String? username;
//   List<InterestedCommunity>? interestedCommunities;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"],
//         emailorphone: json["emailorphone"],
//         username: json["username"],
//         interestedCommunities: List<InterestedCommunity>.from(
//             json["interestedCommunities"]
//                 .map((x) => InterestedCommunity.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "emailorphone": emailorphone,
//         "username": username,
//         "interestedCommunities":
//             List<dynamic>.from(interestedCommunities!.map((x) => x.toJson())),
//       };
// }

// class InterestedCommunity {
//   InterestedCommunity({
//     this.id,
//     this.imageUrl,
//     this.communityName,
//   });

//   String? id;
//   String? imageUrl;
//   String? communityName;

//   factory InterestedCommunity.fromJson(Map<String, dynamic> json) =>
//       InterestedCommunity(
//         id: json["_id"],
//         imageUrl: json["imageUrl"],
//         communityName: json["communityName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "imageUrl": imageUrl,
//         "communityName": communityName,
//       };
// }
