// To parse this JSON data, do
//
//     final screamsEntity = screamsEntityFromJson(jsonString);

import 'dart:convert';

List<ScreamsEntity> screamsEntityFromJson(String str) => List<ScreamsEntity>.from(json.decode(str).map((x) => ScreamsEntity.fromJson(x)));

String screamsEntityToJson(List<ScreamsEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScreamsEntity {
  ScreamsEntity({
    this.screamId,
    this.body,
    this.userHandle,
    this.createdAt,
    this.likeCount,
    this.unlikeCount,
    this.imageUrl,
    this.commentCount,
    this.isLiked,
    this.isDisliked,
  });

  String screamId;
  String body;
  String userHandle;
  DateTime createdAt;
  int likeCount;
  int unlikeCount;
  String imageUrl;
  int commentCount;
  int isLiked;
  int isDisliked;

  factory ScreamsEntity.fromJson(Map<String, dynamic> json) => ScreamsEntity(
    screamId: json["screamId"],
    body: json["body"],
    userHandle: json["userHandle"],
    createdAt: DateTime.parse(json["createdAt"]),
    likeCount: json["likeCount"],
    unlikeCount: json["unlikeCount"],
    imageUrl: json["imageUrl"],
    commentCount: json["commentCount"],
    isLiked: json["isLiked"],
    isDisliked: json["isDisliked"],
  );

  Map<String, dynamic> toJson() => {
    "screamId": screamId,
    "body": body,
    "userHandle": userHandle,
    "createdAt": createdAt.toIso8601String(),
    "likeCount": likeCount,
    "unlikeCount": unlikeCount,
    "imageUrl": imageUrl,
    "commentCount": commentCount,
    "isLiked": isLiked,
    "isDisliked": isDisliked,
  };

}
