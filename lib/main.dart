import 'package:flutter/material.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/allScreamsBuilder.dart';
import 'package:social_app/view/login/login.dart';
import 'package:provider/provider.dart';

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
      theme: Provider.of<ThemeChanger>(context, listen: true).getThemeData,
      home: Scaffold(
        body: LoginPage(),
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  ThemeData theme = themeChanger.getThemeData;
                  if (theme == lightTheme){
                    themeChanger.setThemeData(darkTheme);
                  }

                  else
                    themeChanger.setThemeData(lightTheme);
                },
                child: Icon(Icons.stars_sharp,),
            style:TextButton.styleFrom(primary: isLight(context) ? Colors.red : Colors.yellow),
            )

          ],
        ),
      ),
    );
  }
}
