import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/shared/text_input_decoraion.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/allScreamsBuilder.dart';
import 'package:social_app/view/login/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger =
    Provider.of<ThemeChanger>(context, listen: true);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final _formkey =GlobalKey<FormState>();

String email;
String password;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
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
            Align(
              alignment: Alignment.topCenter,
              child:Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("Login",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,

              child: Padding(
                padding: const EdgeInsets.only(top:20,),
                child: MaterialButton(
                  elevation: 8,
                  child: Icon(Icons.settings),
                  onPressed: (){
                    ThemeData theme = themeChanger.getThemeData;
                    if (theme == lightTheme){
                      themeChanger.setThemeData(darkTheme);
                    }

                    else
                      themeChanger.setThemeData(lightTheme);
                  },
                  shape: CircleBorder(side: BorderSide.none),
                  color: isLight(context) ? Colors.amberAccent : Colors.pinkAccent,
                  splashColor: Colors.grey,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: TextFormField(
                      decoration: textInputDecorationForEmail(isLight(context)),

                      onChanged: (val){
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: TextFormField(
                      decoration: textInputDecorationForPassword(isLight(context)),

                      onChanged: (val){
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 100,bottom: 160),
                child: MaterialButton(
                  elevation: 8,
                  highlightElevation: 10,
                  child: Icon(Icons.person_add),
                  padding: EdgeInsets.all(18),
                  onPressed: (){
                    return Register();
                  },
                  shape: CircleBorder(),
                  color: isLight(context) ? Colors.amberAccent : Colors.pinkAccent,
                  splashColor: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                    right: width * 0.2,
                    // Checks if keyboard is open or not
                    bottom: MediaQuery.of(context).viewInsets.bottom != 0
                        ? 10
                        : height * 0.2),
                duration: Duration(microseconds: 200),
                curve: ElasticInOutCurve(),
                child: MaterialButton(
                  elevation: 8,
                  highlightElevation: 10,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  color: isLight(context) ? Color(0xff3655B5) : Colors.black,
                  padding: EdgeInsets.all(18.0),
                  onPressed: () {
                   return AllScreamsBuilder();
                  },
                  splashColor: Colors.blueGrey.withOpacity(0.4),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
