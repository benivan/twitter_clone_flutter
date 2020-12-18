import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/login/login.dart';
import 'package:social_app/view/login/register.dart';
import 'package:social_app/view/profile/user_profile.dart';

class AuthPageView extends StatefulWidget {

  @override
  _AuthPageViewState createState() => _AuthPageViewState();
}

var key = GlobalKey<ScaffoldState>();

class _AuthPageViewState extends State<AuthPageView> {
  PageController _pageController;
  int currentPage;
  String _email;
  String _password;
  String _confirmPassword;
  String _handle;
  Repository repository;


  @override
  void initState() {
    super.initState();
    repository = Repository();
    _pageController = PageController();
    currentPage = _pageController.initialPage;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageViewChange(int page) {
    setState(() {
      currentPage = page;
    });
  }

  onSubmitButtonPressed() {
    if (currentPage == 0) {
      login( );
    } else {
      signUp();
    }
  }

  login() {
    repository.login(_email, _password)
        .then((value) {
         if (value.statusCode == 200){
         var jwtToken = jsonDecode(value.body)['token'];
         // print(jwtToken);
           SharedPreferences.getInstance().then((sharedPreferences) {
             sharedPreferences.setString("Authorization", jwtToken);
           });
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AllScreamsBuilder()));
         }
         if (value.statusCode == 403){
           var error = jsonDecode(value.body)["genaral"];
           key.currentState.showSnackBar(SnackBar(content: Text(error)));
         }
         if (value.statusCode == 404){
           var error = jsonDecode(value.body)["general"];
           key.currentState.showSnackBar(SnackBar(content: Text(error)));
         }
         if (value.statusCode == 400){
           var emailError = jsonDecode(value.body)["email"];
           var passwordError = jsonDecode(value.body)["password"];
           key.currentState.showSnackBar(SnackBar(content:
               Text((emailError == null ? " " : emailError) + "   "+(passwordError == null ? " " : passwordError )),

           ));
         }

    }).catchError((err){

      key.currentState.showSnackBar(
        SnackBar(content: Text(
          "Something went wrong!"
        ))
      );
    });
  }

  signUp() {
   repository.signup(_email, _password, _confirmPassword, _handle)
       .then((value){
         if(value.statusCode == 201){
           print(value.body);
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyUserProfile()));
         }
   }).catchError((err){
     key.currentState.showSnackBar(
       SnackBar(content: Text(
         "Something went wrong!!"
       ))
     );
   });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: isLight(context)
                        ? [
                            Color(0xFFf4f5f7),
                            Color(0xFFf4f5f7).withOpacity(0.5)
                          ]
                        : [Colors.grey, Colors.grey.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Positioned(
            left: -width,
            top: -width,
            right: -width,
            child: Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isLight(context) ? Colors.black12 : Colors.grey.shade900),
            ),
          ),
          PageView(
            children: [
              LoginPage(
                onTextPressed: () {
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn);
                },
                emailTextChanged: (str) {
                  setState(() {
                    _email = str;
                  });
                },
                passwordChanged: (str) {
                  _password = str;
                },
              ),
              Register(
                passwordChanged: (str){
                  setState(() {
                    _password = str;
                  });
                },
                confirmPasswordChanged: (str){
                  setState(() {
                    _confirmPassword = str;
                  });
                },
                emailTextChanged: (str){
                  setState(() {
                    _email = str;
                  });
                },
                handle: (str){
                  _handle = str;
                },
              ),
            ],
            controller: _pageController,
            onPageChanged: _onPageViewChange,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedPadding(
              duration: Duration(microseconds: 100),
              padding: EdgeInsets.only(
                  right: 30,
                  bottom: MediaQuery.of(context).viewInsets.bottom != 0
                      ? height * 0.3
                      : height * 0.1),
              child: MaterialButton(
                elevation: 8,
                highlightElevation: 10,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 28.0,
                ),
                color: isLight(context) ? Color(0xff3655B5) : Colors.black,
                padding: EdgeInsets.all(18),
                onPressed: onSubmitButtonPressed,
                splashColor: Colors.blueGrey.withOpacity(0.4),
                shape: CircleBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
