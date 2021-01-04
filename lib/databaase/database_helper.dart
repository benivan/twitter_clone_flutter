
import 'dart:convert';

import 'package:path/path.dart';
import 'package:social_app/entitiy/screams_entiry.dart';
import 'package:social_app/model/scream.dart';
import 'package:social_app/response/single_scream_response.dart';
import 'package:social_app/utils/data_mapper.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{

  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  Database _database;

  final DataMapper _dataMapper = DataMapper();

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

 Future<Database> getDatabaseInstance() async {
    String _path = await getDatabasesPath();
    String path = join(_path, "social.db");
    return await openDatabase(path,version: 1,
      onCreate: (Database db, int version) async{
      await db.execute('''
      CREATE TABLE screams(
      screamId TEXT PRIMARY KEY ,
      body TEXT NOT NULL,
      userHandle TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      likeCount INTEGER NOT NULL,
      unlikeCount INTEGER NOT NULL,
      imageUrl TEXT NOT NULL,
      commentCount INTEGER NOT NULL,
      isLiked INTEGER NOT NULL,
      isDisliked INTEGER NOT NULL  
      )'''
      );

      db.execute(
        '''
        CREATE TABLE comment(
        commentId TEXT PRIMARY KEY,
        createdAt TEXT NOT NULL,
        userHandle TEXT NOT NULL,
        screamId TEXT NOT NULL,
        body TEXT NOT NULL,
        imageUrl TEXT TEXT NOT NULL
        )'''
      );


    });
 }

  addScreams(ScreamsEntity screamsEntity) async {
    final db = await database;
    var raw = await db.insert("screams", screamsEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    return raw;
  }

  addComments(Comment comment) async {
    final db = await database;
    var raw = await db.insert("comment", comment.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    return raw;
  }
  // addScream(ScreamResponse screamResponse) async {
  //   final db = await database;
  //   var raw = await db.insert("scream", screamResponse.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace
  //   );
  //   return raw;
  // }

  Future<List<Scream>> getAllScreams() async{
    final db = await database;
    String sql = " SELECT *  FROM screams";
    var response = await db.rawQuery(sql);
    List<ScreamsEntity> list = response.map((e) => ScreamsEntity.fromJson(e)).toList();
    List<Scream> screams= list.map((e) => _dataMapper.mapModelTOEntity(e)).toList();
    return screams;
  }

  // Future<ScreamsResponse> getScreamById(String screamId) async{
  //   final db = await database;
  //   String sql = " SELECT *  FROM screams WHERE screamId == ${screamId}";
  //   var response = await db.rawQuery(sql);
  //   return ScreamsResponse(response);
  //
  // }

}
