 import 'package:flutter/material.dart';



ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
       ));

ThemeData lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
    ));


bool isLight(context) => Theme.of(context).brightness == Brightness.light ? true : false ;






//
// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   fontFamily: "GoogleSans",
//   bottomSheetTheme: BottomSheetThemeData(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15), topLeft: Radius.circular(15))),
//     elevation: 8,
//   ),
//   scaffoldBackgroundColor: Colors.black,
//   backgroundColor: Colors.black,
//   colorScheme: ColorScheme.dark(),
// );
//
// ThemeData lightTheme =  ThemeData(
//     fontFamily: "GoogleSans",
//     brightness: Brightness.light,
//     bottomSheetTheme: BottomSheetThemeData(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(15), topLeft: Radius.circular(15))),
//         elevation: 8,
//         backgroundColor: Colors.white),
//     scaffoldBackgroundColor: Colors.white,
//     backgroundColor: Colors.white,
//     colorScheme: ColorScheme.light()
// );