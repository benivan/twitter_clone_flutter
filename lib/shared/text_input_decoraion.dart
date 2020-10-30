import 'package:flutter/material.dart';

 textInputDecorationForEmail () => InputDecoration(
  // ####### Take A LOOK ######
  contentPadding: const EdgeInsets.only(
      left: 14.0, bottom: 8.0, top: 8.0),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
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
    Icons.person,
    color: Colors.grey,
  ),
  hintText: 'Enter Your Email',
  hintStyle: TextStyle(color: Colors.grey),
  labelText: 'Email',
  labelStyle: TextStyle(
    color: Colors.grey[200],
  ),
  fillColor: Colors.red,// filledColor also need property called filled to be true for use
  focusColor: Colors.white,
);

textInputDecorationForPassword() => InputDecoration(
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 8.0),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.white),
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
Icons.vpn_key_sharp,
color: Colors.grey,
),
hintText: 'Enter Password',
labelText: 'Password',
hintStyle: TextStyle(color: Colors.grey),
labelStyle: TextStyle(
color: Colors.grey[200],
),
fillColor: Colors.grey,
focusColor: Colors.grey
);