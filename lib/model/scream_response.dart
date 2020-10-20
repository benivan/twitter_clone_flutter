class ScreamResponse {
  ScreamResponse({
    this.likeCount,
    this.createdAt,
    this.userHandle,
    this.image,
    this.commentCount,
    this.body,
    this.unlikeCount,
    this.screamId,
    this.comments,
  });

  int likeCount;
  DateTime createdAt;
  String userHandle;
  String image;
  int commentCount;
  String body;
  int unlikeCount;
  String screamId;
  List<Comment> comments;

  factory ScreamResponse.fromJson(Map<String, dynamic> json) => ScreamResponse(
    likeCount: json["likeCount"],
    createdAt: DateTime.parse(json["createdAt"]),
    userHandle: json["userHandle"],
    image: json["image"],
    commentCount: json["commentCount"],
    body: json["body"],
    unlikeCount: json["unlikeCount"],
    screamId: json["screamId"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "likeCount": likeCount,
    "createdAt": createdAt.toIso8601String(),
    "userHandle": userHandle,
    "image": image,
    "commentCount": commentCount,
    "body": body,
    "unlikeCount": unlikeCount,
    "screamId": screamId,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.screamId,
    this.userHandle,
    this.createdAt,
    this.body,
  });

  String screamId;
  String userHandle;
  DateTime createdAt;
  String body;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    screamId: json["screamId"],
    userHandle: json["userHandle"],
    createdAt: DateTime.parse(json["createdAt"]),
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "screamId": screamId,
    "userHandle": userHandle,
    "createdAt": createdAt.toIso8601String(),
    "body": body,
  };
}
