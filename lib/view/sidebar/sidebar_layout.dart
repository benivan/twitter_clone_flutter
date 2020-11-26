import 'package:flutter/material.dart';
import 'package:social_app/view/Home/allScreamsBuilder.dart';
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
