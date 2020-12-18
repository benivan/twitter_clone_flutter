import 'dart:convert';

ScreamResponse screamResponseFromJson(String str) => ScreamResponse.fromJson(json.decode(str));

String screamResponseToJson(ScreamResponse data) => json.encode(data.toJson());

class ScreamResponse {
  ScreamResponse({
    this.commentCount,
    this.userHandle,
    this.likeCount,
    this.createdAt,
    this.image,
    this.body,
    this.unlikeCount,
    this.screamId,
    this.comments,
  });

  int commentCount;
  String userHandle;
  int likeCount;
  DateTime createdAt;
  String image;
  String body;
  int unlikeCount;
  String screamId;
  List<Comment> comments;

  factory ScreamResponse.fromJson(Map<String, dynamic> json) => ScreamResponse(
    commentCount: json["commentCount"],
    userHandle: json["userHandle"],
    likeCount: json["likeCount"],
    createdAt: DateTime.parse(json["createdAt"]),
    image: json["image"],
    body: json["body"],
    unlikeCount: json["unlikeCount"],
    screamId: json["screamId"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "commentCount": commentCount,
    "userHandle": userHandle,
    "likeCount": likeCount,
    "createdAt": createdAt.toIso8601String(),
    "image": image,
    "body": body,
    "unlikeCount": unlikeCount,
    "screamId": screamId,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.screamId,
    this.body,
    this.imageUrl,
    this.userHandle,
    this.createdAt,
    this.commentId,
  });

  String commentId;
  String screamId;
  String body;
  String imageUrl;
  String userHandle;
  DateTime createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    commentId: json["commentId"],
    screamId: json["screamId"],
    body: json["body"],
    imageUrl: json["imageUrl"],
    userHandle: json["userHandle"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "commentId":commentId,
    "screamId": screamId,
    "body": body,
    "imageUrl": imageUrl,
    "userHandle": userHandle,
    "createdAt": createdAt.toIso8601String(),
  };
}
