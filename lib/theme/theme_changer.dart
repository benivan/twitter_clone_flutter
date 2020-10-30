

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{

  ThemeData themeData;
  ThemeChanger({this.themeData});

  ThemeData get getThemeData => themeData;

  setThemeData(ThemeData value){
    themeData = value;
    notifyListeners();
  }

}
