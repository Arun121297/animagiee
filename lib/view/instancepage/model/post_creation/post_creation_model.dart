import 'dart:convert';

PostCreation postCreationFromJson(String str) => PostCreation.fromJson(json.decode(str));

String postCreationToJson(PostCreation data) => json.encode(data.toJson());

class PostCreation {
    PostCreation({
       required this.message,
        required this.data,
    });

    String message;
    Data1 data;

    factory PostCreation.fromJson(Map<String, dynamic> json) => PostCreation(
        message: json["message"],
        data: Data1.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data1 {
    Data1({
        this.postowner,
        this.addImagesOrVideos,
        this.posttype,
        this.like,
        this.description,
        this.tagPeople,
        this.indiviual,
        this.club,
        this.id,
        this.postLike,
        this.saved,
        this.postViewPersons,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? postowner;
    String? addImagesOrVideos;
    String? posttype;
    List<dynamic>? like;
    String? description;
    List<String>? tagPeople;
    bool? indiviual;
    List<String>? club;
    String? id;
    List<dynamic>? postLike;
    List<dynamic>? saved;
    List<dynamic>? postViewPersons;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        postowner: json["postowner"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        like: List<dynamic>.from(json["like"].map((x) => x)),
        description: json["description"],
        tagPeople: List<String>.from(json["tagPeople"].map((x) => x)),
        indiviual: json["indiviual"],
        club: List<String>.from(json["club"].map((x) => x)),
        id: json["_id"],
        postLike: List<dynamic>.from(json["postLike"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        postViewPersons: List<dynamic>.from(json["postViewPersons"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "postowner": postowner,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "like": List<dynamic>.from(like!.map((x) => x)),
        "description": description,
        "tagPeople": List<dynamic>.from(tagPeople!.map((x) => x)),
        "indiviual": indiviual,
        "club": List<dynamic>.from(club!.map((x) => x)),
        "_id": id,
        "postLike": List<dynamic>.from(postLike!.map((x) => x)),
        "saved": List<dynamic>.from(saved!.map((x) => x)),
        "postViewPersons": List<dynamic>.from(postViewPersons!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
