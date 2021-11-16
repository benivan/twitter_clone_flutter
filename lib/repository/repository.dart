import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:social_app/Interceptors/social_interceptor.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/databaase/database_helper.dart';
import 'package:social_app/entitiy/screams_entiry.dart';
import 'package:social_app/model/scream.dart';
import 'dart:convert' as json;


import 'package:social_app/response/all_scream_response.dart';
import 'package:social_app/response/single_scream_response.dart';
import 'package:social_app/response/user_details_response.dart';
import 'package:social_app/utils/data_mapper.dart';
import 'package:social_app/utils/network_mapper.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';

class Repository {
  DatabaseHelper dbHelper = DatabaseHelper.db;
  final NetworkMapper _networkMapper = NetworkMapper();
  final DataMapper _dataMapper = DataMapper();

  Future<SingleScreamResponse> getScreamByIdFromNetwork(String screamId) async {
    try {
      var response = await http.get('$backendUrl/scream/$screamId');
      if (response.statusCode == 200) {
        var jsonResponse = json.jsonDecode(response.body);
        SingleScreamResponse sr = SingleScreamResponse.fromJson(jsonResponse);

        for (var comment in sr.comments) {
          dbHelper.addComments(comment);
        }
        return SingleScreamResponse.fromJson(jsonResponse);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UserDetailsResponse> getUserDetails() async {
    var htp = HttpWithInterceptor.build(interceptors: [SocialInterceptor()]);
    try {
      var response = await htp.get('$backendUrl/user');
      if (response.statusCode == 200) {
        var jsonResponse = json.jsonDecode(response.body);
        return UserDetailsResponse.fromJson(jsonResponse);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<SingleScreamResponse> fetchScreamById(
      {@required String screamId}) async {
    var dbResponse = null;

    if (dbResponse == null) {
      return getScreamByIdFromNetwork(screamId);
    } else
      return dbResponse;
  }

  Future<List<Scream>> fetchAllScreams() {
    return dbHelper.getAllScreams().then((value) {
      if (value.isEmpty) {
        return getAllScreamsFromNetwork();
      }
      return value;
    });
  }

  Future<List<Scream>> getAllScreamsFromNetwork() async {
    var htp = HttpWithInterceptor.build(interceptors: [SocialInterceptor()]);
    try {
      List<Scream> screams = [];
      var response = await htp.get('$backendUrl/screams');
      var jsonResponse = json.jsonDecode(response.body);
      for (var item in jsonResponse) {
        ScreamResponse sr = ScreamResponse.fromJson(item);
        ScreamsEntity st = _networkMapper.mapModelTOEntity(sr);
        Scream scream = _dataMapper.mapModelTOEntity(st);
        dbHelper.addScreams(st);
        screams.add(scream);
      }
      return screams;
    } catch (e) {
      throw e;
    }
  }

  Future<Scream> postScream(String scream) async {
    var htp = HttpWithInterceptor.build(interceptors: [SocialInterceptor()]);
    try {
      String url = backendUrl + "/scream";
      String requestBody = jsonEncode(<String, String>{
        "body": scream,
      });
      var headers = {"content-type": "application/json"};
      var resp = await htp.post(url, headers: headers, body: requestBody);
      var jsonResponse = json.jsonDecode(resp.body);
      ScreamResponse sr = ScreamResponse.fromJsons(jsonResponse["resScream"]);
      ScreamsEntity st = _networkMapper.mapModelTOEntity(sr);
      Scream s = _dataMapper.mapModelTOEntity(st);
      dbHelper.addScreams(st);
      return s;
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

  Future<Response> signup(String email, String password, String confirmPassword,
      String handle) async {
    Client client = Client();
    String url = backendUrl + "/signup";
    String requestBody =
        '{"email": "$email", "password":"$password","confirmPassword":"$confirmPassword","handle":"$handle"}';
    var headers = {"content-type": "application/json"};
    Response resp = await client.post(url, headers: headers, body: requestBody);
    return resp;
  }
}
