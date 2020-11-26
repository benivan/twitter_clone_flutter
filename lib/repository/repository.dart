import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/databaase/database_helper.dart';
import 'dart:convert' as json;

import 'package:social_app/model/scream_response.dart';
import 'package:social_app/model/screams_response.dart';

class Repository {

  DatabaseHelper dbHelper = DatabaseHelper.db;

  Future<ScreamResponse> getScreamById({@required String screamId}) async {
    try {
      var response = await http.get('$backendUrl/scream/$screamId');
      if (response.statusCode == 200) {
        var jsonResponse = json.jsonDecode(response.body);
        return ScreamResponse.fromJson(jsonResponse);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }


  Future<List<ScreamsResponse>> fetchAllScreams() async{
    List<ScreamsResponse> dbResponse =
       await dbHelper.getAllScreams();
    if(dbResponse.isEmpty){
      return getAllScreamsFromNetwork();
    }
    else
      return dbResponse;
  }


  Future<List<ScreamsResponse>> getAllScreamsFromNetwork() async {
    try {
      List<ScreamsResponse> screams = [];
      var response = await http.get('$backendUrl/screams');
      var jsonResponse = json.jsonDecode(response.body);

      for (var item in jsonResponse) {
        ScreamsResponse sr = ScreamsResponse.fromJson(item);
        dbHelper.addScreams(sr);
        screams.add(sr);
      }
      print(screams.length);
      return screams;
    } catch (e) {
      throw e;
    }
  }



  Future<Response> login(String username, String password) async {
    Client client = Client();
    String url = backendUrl + "/login";
    String requestBody = '{"username": "$username", "password":"$password"}';
    var headers = {"content-type": "application/json"};
    Response resp = await client.post(url, headers: headers, body: requestBody);

    return resp;
  }


}


