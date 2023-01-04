 import 'dart:convert';

SelectGroup selectGroupFromJson(String str) => SelectGroup.fromJson(json.decode(str));

String selectGroupToJson(SelectGroup data) => json.encode(data.toJson());

class SelectGroup {
    SelectGroup({
        required this.message,
        required this.data,
    });

    String message;
    List<Data2> data;

    factory SelectGroup.fromJson(Map<String, dynamic> json) => SelectGroup(
        message: json["message"],
        data: List<Data2>.from(json["data"].map((x) => Data2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data2 {
    Data2({
        this.clubicon,
        this.clubid,
        this.clubName,
    });

    String? clubicon;
    String? clubid;
    String? clubName;

    factory Data2.fromJson(Map<String, dynamic> json) => Data2(
        clubicon: json["clubicon"],
        clubid: json["clubid"],
        clubName: json["clubName"],
    );

    Map<String, dynamic> toJson() => {
        "clubicon": clubicon,
        "clubid": clubid,
        "clubName": clubName,
    };
}
