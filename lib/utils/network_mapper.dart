import 'package:social_app/entitiy/screams_entiry.dart';

import 'package:social_app/response/all_scream_response.dart';
import 'package:social_app/utils/mapper.dart';

class NetworkMapper implements Mapper<ScreamsEntity, ScreamResponse> {
  static final Mapper _instance = NetworkMapper._internal();

  factory NetworkMapper() => _instance;

  NetworkMapper._internal();

  @override
  ScreamResponse mapEntityToModel(ScreamsEntity entity) {
    return ScreamResponse(
        screamId: entity.screamId,
        body: entity.body,
        userHandle: entity.userHandle,
        createdAt: entity.createdAt,
        likeCount: entity.likeCount,
        unlikeCount: entity.unlikeCount,
        imageUrl: entity.imageUrl,
        commentCount: entity.commentCount,
        isLiked: entity.isLiked == 1 ? true : false,
        isDisliked: entity.isDisliked == 1 ? true : false);
    throw UnimplementedError();
  }

  @override
  ScreamsEntity mapModelTOEntity(ScreamResponse model) {
    return ScreamsEntity(
        screamId: model.screamId,
        body: model.body,
        userHandle: model.userHandle,
        createdAt: model.createdAt,
        likeCount: model.likeCount,
        unlikeCount: model.unlikeCount,
        imageUrl: model.imageUrl,
        commentCount: model.commentCount,
        isLiked: model.isLiked == true ? 1 : 0 ?? false,
        isDisliked: model.isDisliked == true ? 1 : 0 ?? false
    );
    throw UnimplementedError();
  }
}
