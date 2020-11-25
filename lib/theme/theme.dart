 import 'package:flutter/material.dart';
import '';



ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
       ));

ThemeData lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
    ));


bool isLight(context) => Theme.of(context).brightness == Brightness.light ? true : false ;


