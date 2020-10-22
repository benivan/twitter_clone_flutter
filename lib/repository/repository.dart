import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_app/constant.dart';
import 'dart:convert' as json;

import 'package:social_app/model/scream_response.dart';
import 'package:social_app/model/screams_response.dart';

class Repository {
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

  Future<List<ScreamsResponse>> getAllScreams() async {
    try {
      List<ScreamsResponse> screams = [];
      var response = await http.get('$backendUrl/screams');
      var jsonResponse = json.jsonDecode(response.body);

      for (var item in jsonResponse) {
        ScreamsResponse sr = ScreamsResponse.fromJson(item);
        screams.add(sr);
      }
      print(screams.length);
      return screams;
    } catch (e) {
      throw e;
    }
  }
}
