import 'package:flutter/material.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'file:///C:/Users/itsme/AndroidStudioProjects/social_app/lib/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/login/login.dart';
import 'package:provider/provider.dart';
import 'package:social_app/view/login/register.dart';
import 'package:social_app/view/sidebar/sidebar_layout.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(themeData: lightTheme),
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger =
        Provider.of<ThemeChanger>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context, listen: true).getThemeData,
      home:
        Scaffold(body: SideBarLayout())
    );
  }
}
