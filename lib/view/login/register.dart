import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/shared/text_input_decoraion.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/login/login.dart';

class Register extends StatefulWidget {
  final Function(String) emailTextChanged;
  final Function(String) passwordChanged;
  final Function(String) confirmPasswordChanged;
  final Function(String) handle;

  const Register(
      {Key key,
      this.emailTextChanged,
      this.passwordChanged,
      this.confirmPasswordChanged,
      this.handle})
      : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger =
        Provider.of<ThemeChanger>(context, listen: true);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final _formkey = GlobalKey<FormState>();

    String email;
    String password;

    return Container(
      color: Colors.transparent,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.06),
            child: Center(
                child: Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: TextFormField(
                  decoration: textInputDecorationForEmail(isLight(context),
                      "Enter Your Email", "  Email", Icons.person),
                  onChanged: widget.emailTextChanged,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                    decoration: textInputDecorationForPassword(isLight(context),
                        "Enter Password", "Password", Icons.vpn_key),
                    onChanged: widget.passwordChanged),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                    decoration: textInputDecorationForPassword(isLight(context),
                        "Enter Password", " Confirm Password", Icons.vpn_key),
                    onChanged: widget.confirmPasswordChanged),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 100, 0),
                child: TextFormField(
                  decoration: textInputDecorationForPassword(
                      isLight(context),
                      "Enter your favorite handle",
                      "Handle",
                      Icons.alternate_email_outlined),
                  onChanged: widget.handle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
