// To parse this JSON data, do
//
//     final removeFollowers = removeFollowersFromJson(jsonString);

import 'dart:convert';

RemoveFollowers removeFollowersFromJson(String str) =>
    RemoveFollowers.fromJson(json.decode(str));

String removeFollowersToJson(RemoveFollowers data) =>
    json.encode(data.toJson());

class RemoveFollowers {
  RemoveFollowers({
    this.followerUserid,
  });

  String? followerUserid;

  factory RemoveFollowers.fromJson(Map<String, dynamic> json) =>
      RemoveFollowers(
        followerUserid: json["followerUserid"],
      );

  Map<String, dynamic> toJson() => {
        "followerUserid": followerUserid,
      };
}
