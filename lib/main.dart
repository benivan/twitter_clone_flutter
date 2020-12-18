import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:social_app/splash_screen.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/login/LoginPageView.dart';
import 'package:social_app/view/login/login.dart';
import 'package:provider/provider.dart';
import 'package:social_app/view/login/register.dart';
import 'package:social_app/view/sidebar/sidebar_layout.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();
  runApp(MyApp());
}

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
        home: SplashScreen()
    );
  }
}
