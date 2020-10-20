import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:social_app/constant.dart';
import 'dart:convert';

import 'package:social_app/model/scream_response.dart';



class Repository {
  Future<ScreamResponse> getScreamById ({@required String screamId}) async{
    var response = await http.get('$backendUrl/$screamId');
    var jsonResponse = jsonDecode(response.body);
    return ScreamResponse.fromJson(jsonResponse);
  }
}