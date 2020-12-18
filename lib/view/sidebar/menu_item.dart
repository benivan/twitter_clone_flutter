import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final IconData iconData;
  final String title;

  const MenuItems({Key key, this.iconData, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            iconData, color: Colors.cyan,
            size: 30,
          ),
          SizedBox(width: 20,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 26,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
