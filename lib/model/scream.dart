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
