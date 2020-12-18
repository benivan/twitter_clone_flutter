import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/login/LoginPageView.dart';
import 'package:social_app/view/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      SharedPreferences.getInstance().then((sharedPreferences) {
        if(sharedPreferences.containsKey("Authorization")){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AllScreamsBuilder()));
        }
        else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthPageView()));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:Brightness.dark,
    ));

    return Container(
    );
  }
}
