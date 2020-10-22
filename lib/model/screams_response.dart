import 'dart:convert';

List<ScreamsResponse> screamsResponseFromJson(String str) => List<ScreamsResponse>.from(json.decode(str).map((x) => ScreamsResponse.fromJson(x)));

String screamsResponseToJson(List<ScreamsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScreamsResponse {
  ScreamsResponse({
    this.screamId,
    this.body,
    this.userHandle,
    this.createdAt,
    this.likeCount,
    this.unlikeCount,
    this.imageUrl,
    this.commentCount,
  });

  String screamId;
  String body;
  String userHandle;
  DateTime createdAt;
  int likeCount;
  int unlikeCount;
  String imageUrl;
  int commentCount;

  factory ScreamsResponse.fromJson(Map<String, dynamic> json) => ScreamsResponse(
    screamId: json["screamId"],
    body: json["body"],
    userHandle: json["userHandle"],
    createdAt: DateTime.parse(json["createdAt"]),
    likeCount: json["likeCount"],
    unlikeCount: json["unlikeCount"],
    imageUrl: json["imageUrl"],
    commentCount: json["commentCount"],
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
  };
}