import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/Home/scream_builder.dart';
import 'package:social_app/view/login/LoginPageView.dart';

import 'cubit/scream_cubit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      SharedPreferences.getInstance().then((sharedPreferences) {
        if (sharedPreferences.containsKey("Authorization")) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ScreamCubit(Repository()),
                    child: ScreamBuilder(),
                  )));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AuthPageView()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Container(
      child: Center(
        child: LoadingWidget(),
      ),
      color: isLight(context) ? Colors.white : Colors.black45,
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/loading.gif",
      height: 250,
      width: 250,
    );
  }
}
