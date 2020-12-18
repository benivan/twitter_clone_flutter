import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:social_app/Interceptors/social_interceptor.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/databaase/database_helper.dart';
import 'dart:convert' as json;

import 'package:social_app/model/scream_response.dart';
import 'package:social_app/model/all_screams.dart';
import 'package:social_app/model/user_details.dart';

class Repository {

  DatabaseHelper dbHelper = DatabaseHelper.db;

  Future<ScreamResponse> getScreamByIdFromNetwork(String screamId) async {
    try {
      var response = await http.get('$backendUrl/scream/$screamId');
      if (response.statusCode == 200) {
        var jsonResponse = json.jsonDecode(response.body);
        ScreamResponse sr = ScreamResponse.fromJson(jsonResponse);
        for(var comment in sr.comments){
          dbHelper.addComments(comment);
        }
        return ScreamResponse.fromJson(jsonResponse);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UserDetailsResponse> getUserDetails() async{
    var htp =
    HttpWithInterceptor.build(interceptors: [SocialInterceptor()]);
    try{
      var response = await htp.get('$backendUrl/user');
      if(response.statusCode == 200){
        var jsonResponse = json.jsonDecode(response.body);
         return  UserDetailsResponse.fromJson(jsonResponse);
      }else{
        throw Exception(response.statusCode);
      }
    }catch(e){
      throw e;
    }
  }

  Future <ScreamResponse> fetchScreamById({@required String screamId}) async{
    var dbResponse = null;
    // ScreamResponse dbResponse =
    //     await dbHelper.getScreamById(screamId);
    if(dbResponse==null){
      return getScreamByIdFromNetwork(screamId);
    }
    else
      return dbResponse;

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
      return screams;
    } catch (e) {
      throw e;
    }
  }




  Future<Response> login(String username, String password) async {
    Client client = Client();
    String url = backendUrl + "/login";
    String requestBody = '{"email": "$username", "password":"$password"}';
    var headers = {"content-type": "application/json"};
    Response resp = await client.post(url, headers: headers, body: requestBody);
    return resp;
  }

  Future<Response> signup(String email, String password, String confirmPassword, String handle) async {
    Client client = Client();
    String url = backendUrl + "/signup";
    String requestBody = '{"email": "$email", "password":"$password","confirmPassword":"$confirmPassword","handle":"$handle"}';
    var headers = {"content-type": "application/json"};
    Response resp = await client.post(url, headers: headers, body: requestBody);
    return resp;
  }


}


