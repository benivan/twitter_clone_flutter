class ScreamResponse {
  ScreamResponse({
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
  bool isLiked;
  bool isDisliked;

  factory ScreamResponse.fromJson(Map<String, dynamic> json) =>
      ScreamResponse(
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
  factory ScreamResponse.fromJsons(Map<String, dynamic> json) =>
      ScreamResponse(
        screamId: json["screamId"],
        body: json["body"],
        userHandle: json["userHandle"],
        createdAt: DateTime.parse(json["createdAt"]),
        likeCount: json["likeCount"],
        unlikeCount: json["unlikeCount"],
        imageUrl: json["image"],
        commentCount: json["commentCount"],
        isLiked: json["isLiked"],
        isDisliked: json["isDisliked"],
      );

  factory ScreamResponse.fromDB(Map<String, dynamic> json) =>
      ScreamResponse(
        screamId: json["screamId"],
        body: json["body"],
        userHandle: json["userHandle"],
        createdAt: DateTime.parse(json["createdAt"]),
        likeCount: json["likeCount"],
        unlikeCount: json["unlikeCount"],
        imageUrl: json["imageUrl"],
        commentCount: json["commentCount"],
        isLiked: json["isLiked"] == 1 ? true: false,
        isDisliked: json["isDisliked"] == 1 ? true: false,
      );


  @override
  String toString() {
    return 'ScreamResponse{screamId: $screamId, body: $body, userHandle: $userHandle, createdAt: $createdAt, likeCount: $likeCount, unlikeCount: $unlikeCount, imageUrl: $imageUrl, commentCount: $commentCount, isLiked: $isLiked, isDisliked: $isDisliked}';
  }

  Map<String, dynamic> toJson() => {
        "screamId": screamId,
        "body": body,
        "userHandle": userHandle,
        "createdAt": createdAt.toIso8601String(),
        "likeCount": likeCount,
        "unlikeCount": unlikeCount,
        "imageUrl": imageUrl,
        "commentCount": commentCount,
        "isLiked": isLiked ? 1 : 0,
        "isDisliked": isDisliked ? 1 : 0,
      };
}
