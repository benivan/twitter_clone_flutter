import 'package:social_app/entitiy/screams_entiry.dart';
import 'package:social_app/model/scream.dart';
import 'mapper.dart';

class DataMapper implements Mapper<Scream, ScreamsEntity> {
  static final Mapper _instance = DataMapper._internal();

  factory DataMapper() => _instance;

  DataMapper._internal();

  @override
  ScreamsEntity mapEntityToModel(Scream model) {
    // TODO: implement mapEntityToModel
    throw UnimplementedError();
  }

  @override
  Scream mapModelTOEntity(ScreamsEntity entity) {
   return Scream(
       screamId: entity.screamId,
       body: entity.body,
       userHandle: entity.userHandle,
       createdAt: entity.createdAt,
       likeCount: entity.likeCount,
       unlikeCount: entity.unlikeCount,
       imageUrl: entity.imageUrl,
       commentCount: entity.commentCount,
       isLiked: entity.isLiked == 1 ? true : false,
       isDisliked: entity.isDisliked == 1 ? true : false
   );
  }

}
