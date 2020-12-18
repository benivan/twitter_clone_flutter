import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/shared/text_input_decoraion.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/login/register.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback onTextPressed;
  final Function(String) emailTextChanged;
  final Function(String) passwordChanged;
  final Function(String) passwordValidator;


  LoginPage({this.onTextPressed,this.emailTextChanged,this.passwordChanged, this.passwordValidator});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger =
    Provider.of<ThemeChanger>(context, listen: true);

    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      color: Colors.transparent,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.06),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: TextFormField(
              decoration: textInputDecorationForEmail(
                  isLight(context), "Enter Your Email", "Email", Icons.person),
              onChanged: widget.emailTextChanged,
              validator: (val) {
                if (val.isEmpty) return "Please Enter Email";
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: TextFormField(
              decoration:
              textInputDecorationForPassword(
                  isLight(context), "Enter Password", "Password",
                  Icons.vpn_key),
              onChanged: widget.passwordChanged,
              // validator: widget.passwordValidator,
              validator: (val) {
                if (val.isEmpty) return 'Please Enter Password ';
                if (val.length < 6)
                  return 'Please Enter 6 or more digit Password';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: InkWell(
              onTap: () {
                widget.onTextPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Swipe to Register ", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_outlined, size: 25,)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(icon: Icon(Icons.stars,)
              , onPressed: () {
                ThemeData theme = themeChanger.getThemeData;
                if (theme == lightTheme) {
                  themeChanger.setThemeData(darkTheme);
                }

                else
                  themeChanger.setThemeData(lightTheme);
              },),
          ),
        ],
      ),
    );
  }
}
