import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/app_constants.dart';
import 'package:social_app/splash_screen.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:provider/provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkThemeEnbale;


  @override
  void initState() {
    super.initState();
    openSharePref();
  }

  openSharePref() {
    SharedPreferences.getInstance().then((sharedPreferences) {
      if (sharedPreferences.containsKey(isDarkThemeEnabled)) {
        isDarkThemeEnbale = sharedPreferences.getBool(isDarkThemeEnabled);
      } else {
        isDarkThemeEnbale = false;
        sharedPreferences.setBool(isDarkThemeEnabled, false);
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return ThemeChanger(
              themeData: !isDarkThemeEnbale ? lightTheme : darkTheme);
        },
        child:
            isDarkThemeEnbale == null ? Center(child: LoadingWidget()) : Home());
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeChanger>(context, listen: true).getThemeData,
        darkTheme: darkTheme,
        home: SplashScreen());
  }
}
