

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/theme/theme.dart';

class ThemeChanger extends ChangeNotifier{

  ThemeData themeData;
  ThemeChanger({this.themeData});

  ThemeData get getThemeData => themeData;

  setThemeData(ThemeData value){
    themeData = value;

    notifyListeners();
  }

}
