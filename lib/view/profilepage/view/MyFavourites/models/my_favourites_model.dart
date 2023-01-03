import 'dart:convert';

MyFavouritesModel myFavouritesModelFromJson(String str) =>
    MyFavouritesModel.fromJson(json.decode(str));

String myFavouritesModelToJson(MyFavouritesModel data) =>
    json.encode(data.toJson());

class MyFavouritesModel {
  MyFavouritesModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory MyFavouritesModel.fromJson(Map<String, dynamic> json) =>
      MyFavouritesModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum(
      {this.postid,
      this.indiviual,
      this.addImagesOrVideos,
      this.posttype,
      this.postowner,
      this.description,
      this.likecount,
      this.postViewCount,
      this.liked,
      this.saved,
      this.blocked});

  String? postid;
  bool? indiviual;
  String? addImagesOrVideos;
  String? posttype;
  Postowner? postowner;
  String? description;
  int? likecount;
  int? postViewCount;
  bool? liked;
  bool? saved;
  bool? blocked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        postid: json["postid"],
        indiviual: json["indiviual"],
        addImagesOrVideos: json["addImagesOrVideos"],
        posttype: json["posttype"],
        postowner: Postowner.fromJson(json["postowner"]),
        description: json["description"],
        likecount: json["likecount"],
        postViewCount: json["postViewCount"],
        liked: json["liked"],
        saved: json["saved"],
        blocked: json["Blocked"],
      );

  Map<String, dynamic> toJson() => {
        "postid": postid,
        "indiviual": indiviual,
        "addImagesOrVideos": addImagesOrVideos,
        "posttype": posttype,
        "postowner": postowner!.toJson(),
        "description": description,
        "likecount": likecount,
        "postViewCount": postViewCount,
        "liked": liked,
        "saved": saved,
        "Blocked": blocked
      };
}

class Postowner {
  Postowner({
    this.id,
    this.profileicon,
    this.username,
  });

  String? id;
  String? profileicon;
  String? username;

  factory Postowner.fromJson(Map<String, dynamic> json) => Postowner(
        id: json["_id"],
        profileicon: json["profileicon"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profileicon": profileicon,
        "username": username,
      };
}
