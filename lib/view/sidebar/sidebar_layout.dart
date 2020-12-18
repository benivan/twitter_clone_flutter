import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/login/LoginPageView.dart';
import 'package:social_app/view/profile/user_profile.dart';
import 'package:social_app/view/sidebar/SideBar.dart';

import '../../constant.dart';
import 'menu_item.dart';

class SideBarLayout extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    return Column(
      children: [
        SizedBox(height: 100,),
        ListTile(
          title: Text(
            "Vikash Kumar",
            style: TextStyle(color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800),
          ),
          subtitle: Text(
            "itsmevikash09@gmail.com",
            style: TextStyle(
                color: Colors.white60
            ),
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              myImage,
            ),
          ),
        ),
        Divider(
          height: 50,
          thickness: .5,
          color: Colors.white.withOpacity(0.5),
          indent: 32,
          endIndent: 32,
        ),
        MenuItems(iconData: Icons.home, title: "Home",),
        InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyUserProfile()));
              },
            child: MenuItems(iconData: Icons.person, title: "My Account",)),
        Divider(
          height: 50,
          thickness: .5,
          color: Colors.white.withOpacity(0.5),
          indent: 32,
          endIndent: 32,
        ),
        MenuItems(iconData: Icons.settings, title: "Settings",),
        InkWell(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthPageView()));
            SharedPreferences.getInstance().then((sharedPreferences) {
              sharedPreferences.clear();
            });
          } ,
          child: MenuItems(
            iconData: Icons.exit_to_app, title: "Logout",),
        ),
        Divider(
          height: 50,
          thickness: .5,
          color: Colors.white.withOpacity(0.5),
          indent: 32,
          endIndent: 32,
        ),
        Row(
          children: [
            IconButton(icon: Icon(Icons.stars,
              color: isLight(context) ? Colors.black : Colors
                  .white,)
              , onPressed: () {
                ThemeData theme = themeChanger.getThemeData;
                if (theme == lightTheme) {
                  themeChanger.setThemeData(darkTheme);
                }

                else
                  themeChanger.setThemeData(lightTheme);
              },),
            Text(isLight(context)? "Dark" : "Light",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 26,
                color: Colors.white,
              ),
            )
          ],
        ),


      ],
    );
  }
}
