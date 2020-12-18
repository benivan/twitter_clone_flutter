
import 'dart:convert';

import 'package:path/path.dart';
import 'package:social_app/model/scream_response.dart';
import 'package:social_app/model/all_screams.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{

  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  Database _database;


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
      commentCount INTEGER NOT NULL
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

  addScreams(ScreamsResponse screamsResponse) async {
    final db = await database;
    var raw = await db.insert("screams", screamsResponse.toJson(),
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

  Future<List<ScreamsResponse>> getAllScreams() async{
    final db = await database;
    String sql = " SELECT *  FROM screams";
    var response = await db.rawQuery(sql);
    List<ScreamsResponse> list = response.map((e) => ScreamsResponse.fromJson(e)).toList();
    return list;
  }

  // Future<ScreamsResponse> getScreamById(String screamId) async{
  //   final db = await database;
  //   String sql = " SELECT *  FROM screams WHERE screamId == ${screamId}";
  //   var response = await db.rawQuery(sql);
  //   return ScreamsResponse(response);
  //
  // }





}
