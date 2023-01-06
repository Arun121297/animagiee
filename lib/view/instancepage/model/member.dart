import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
    Member({
        this.message,
        this.data,
    });

    String? message;
    List<Member2>? data;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        message: json["message"],
        data: List<Member2>.from(json["data"].map((x) => Member2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Member2 {
    Member2({
        this.userid,
        this.profileicon,
        this.username,
        this.requestid2,
    });

    String? userid;
    String? profileicon;
    String? username;
    List<dynamic>? requestid2;

    factory Member2.fromJson(Map<String, dynamic> json) => Member2(
        userid: json["userid"],
        profileicon: json["profileicon"],
        username: json["username"],
        requestid2: List<dynamic>.from(json["requestid2"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "userid": userid,
        "profileicon": profileicon,
        "username": username,
        "requestid2": List<dynamic>.from(requestid2!.map((x) => x)),
    };
}
