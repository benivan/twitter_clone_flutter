class Scream {
  Scream({
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

  factory Scream.fromMap(Map<String, dynamic> map) {
    return new Scream(
      screamId: map['screamId'] as String,
      body: map['body'] as String,
      userHandle: map['userHandle'] as String,
      createdAt: map['createdAt'] as DateTime,
      likeCount: map['likeCount'] as int,
      unlikeCount: map['unlikeCount'] as int,
      imageUrl: map['imageUrl'] as String,
      commentCount: map['commentCount'] as int,
      isLiked: map['isLiked'] as bool,
      isDisliked: map['isDisliked'] as bool,
    );
  }

  // Map<String, dynamic> toMap() {
  //   // ignore: unnecessary_cast
  //   return {
  //     'screamId': this.screamId,
  //     'body': this.body,
  //     'userHandle': this.userHandle,
  //     'createdAt': this.createdAt,
  //     'likeCount': this.likeCount,
  //     'unlikeCount': this.unlikeCount,
  //     'imageUrl': this.imageUrl,
  //     'commentCount': this.commentCount,
  //     'isLiked': this.isLiked,
  //     'isDisliked': this.isDisliked,
  //   } as Map<String, dynamic>;
  // }

  @override
  String toString() {
    return 'Scream{screamId: $screamId, body: $body, userHandle: $userHandle, createdAt: $createdAt, likeCount: $likeCount, unlikeCount: $unlikeCount, imageUrl: $imageUrl, commentCount: $commentCount, isLiked: $isLiked, isDisliked: $isDisliked}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scream &&
          runtimeType == other.runtimeType &&
          screamId == other.screamId &&
          body == other.body &&
          userHandle == other.userHandle &&
          createdAt == other.createdAt &&
          likeCount == other.likeCount &&
          unlikeCount == other.unlikeCount &&
          imageUrl == other.imageUrl &&
          commentCount == other.commentCount &&
          isLiked == other.isLiked &&
          isDisliked == other.isDisliked;

  @override
  int get hashCode =>
      screamId.hashCode ^
      body.hashCode ^
      userHandle.hashCode ^
      createdAt.hashCode ^
      likeCount.hashCode ^
      unlikeCount.hashCode ^
      imageUrl.hashCode ^
      commentCount.hashCode ^
      isLiked.hashCode ^
      isDisliked.hashCode;
}
