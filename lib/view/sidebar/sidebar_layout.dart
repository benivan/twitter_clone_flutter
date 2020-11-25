import 'package:flutter/material.dart';
import 'file:///C:/Users/itsme/AndroidStudioProjects/social_app/lib/view/Home/allScreamsBuilder.dart';
import 'package:social_app/view/sidebar/SideBar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AllScreamsBuilder(),
      ],
    );
  }
}
