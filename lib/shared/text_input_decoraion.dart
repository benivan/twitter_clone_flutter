import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

textInputDecorationForEmail(
        bool isLight, String hint, String hintLable, IconData formIcon) =>
    InputDecoration(
      // ####### Take A LOOK ######
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: isLight ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(25.7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(25.7),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(25.7),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(25.7),
      ),
      icon: Icon(
        formIcon,
        color: isLight ? Colors.grey.shade900 : Colors.white,
      ),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      labelText: hintLable,
      labelStyle: TextStyle(
        color: isLight ? Colors.grey.shade800 : Colors.grey[200],
      ),
      fillColor: Colors.red,
      // filledColor also need property called filled to be true for use
      focusColor: Colors.white,
    );

textInputDecorationForPassword(
        bool isLight, String hint, String lable, IconData formIcon) =>
    InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isLight ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25.7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(25.7),
        ),
        icon: Icon(
          formIcon,
          color: isLight ? Colors.grey.shade900 : Colors.white,
        ),
        hintText: hint,
        labelText: lable,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(
          color: isLight ? Colors.grey.shade800 : Colors.grey[200],
        ),
        fillColor: Colors.grey,
        focusColor: Colors.grey);

  textInputDecorationForCommentPanel(
  bool isLight,
  String hint,
) =>
    InputDecoration(
      suffixIcon: Icon(Icons.send),
        hintText: hint,
        contentPadding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: isLight ? Colors.black: Colors.white)), 
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)));
