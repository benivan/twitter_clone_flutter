// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:social_app/constant.dart';
// import 'package:social_app/theme/theme.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:social_app/theme/theme_changer.dart';
// import 'package:social_app/view/sidebar/menu_item.dart';
// import 'package:social_app/view/sidebar/sidebar_layout.dart';
//
// class SideBar extends StatefulWidget {
//   @override
//   _SideBarState createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar>
//     with SingleTickerProviderStateMixin<SideBar> {
//
//   StreamController <bool> isSidebarOpenedStreamController;
//   Stream <bool> isSidebarOpenedStream;
//   StreamSink <bool> isSidebarOpenedSink;
//   AnimationController _animationController;
//
//   // final bool isSidebarOpened = false;
//   var _animationDuration = const Duration(milliseconds: 300);
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: _animationDuration);
//     isSidebarOpenedStreamController = PublishSubject<bool>();
//     isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
//     isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     isSidebarOpenedStreamController.close();
//     isSidebarOpenedSink.close();
//     super.dispose();
//   }
//
//   void onIconPressed() {
//     final animationStatus = _animationController.status;
//     final isAnimationCompleted = animationStatus == AnimationStatus.completed;
//
//     if (isAnimationCompleted) {
//       isSidebarOpenedSink.add(false);
//       _animationController.reverse();
//     } else {
//       isSidebarOpenedSink.add(true);
//       _animationController.forward();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeChanger themeChanger = Provider.of<ThemeChanger>(
//         context, listen: true);
//
//     final screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     final screenHeight = MediaQuery
//         .of(context)
//         .size
//         .height;
//
//     return StreamBuilder<bool>(
//       initialData: false,
//       stream: isSidebarOpenedStream,
//       builder: (context, isSideBarOpenedAsync) {
//         return AnimatedPositioned(
//           top: 0,
//           bottom: 0,
//           left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
//           right: isSideBarOpenedAsync.data ? screenWidth/99999  : screenWidth -
//               40,
//           duration: _animationDuration,
//           child: Row(
//             children: [
//               Container(
//                 color: isLight(context) ? Color(0xff6200ee) : Colors.grey
//                     .shade900,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 100,),
//                     ListTile(
//                       title: Text(
//                         "Vikash Kumar",
//                         style: TextStyle(color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.w800),
//                       ),
//                       subtitle: Text(
//                         "itsmevikash09@gmail.com",
//                         style: TextStyle(
//                             color: Colors.white60
//                         ),
//                       ),
//                       leading: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                           myImage,
//                            ),
//                       ),
//                     ),
//                     Divider(
//                       height: 50,
//                       thickness: .5,
//                       color: Colors.white.withOpacity(0.5),
//                       indent: 32,
//                       endIndent: 32,
//                     ),
//                     MenuItems(iconData: Icons.home, title: "Home",),
//                     MenuItems(iconData: Icons.person, title: "My Account",),
//                     Divider(
//                       height: 50,
//                       thickness: .5,
//                       color: Colors.white.withOpacity(0.5),
//                       indent: 32,
//                       endIndent: 32,
//                     ),
//
//                     MenuItems(iconData: Icons.settings, title: "Settings",),
//                     MenuItems(
//                       iconData: Icons.exit_to_app, title: "Logout",),
//                     Divider(
//                       height: 50,
//                       thickness: .5,
//                       color: Colors.white.withOpacity(0.5),
//                       indent: 32,
//                       endIndent: 32,
//                     ),
//                     Row(
//                       children: [
//                         IconButton(icon: Icon(Icons.stars,
//                           color: isLight(context) ? Colors.orangeAccent : Colors
//                               .amber,)
//                             , onPressed: () {
//                               ThemeData theme = themeChanger.getThemeData;
//                               if (theme == lightTheme) {
//                                 themeChanger.setThemeData(darkTheme);
//                               }
//
//                               else
//                                 themeChanger.setThemeData(lightTheme);
//                             },),
//
//                         Text(
//                           "Theme",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             fontSize: 26,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//
//
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   onIconPressed();
//                 },
//                 child: ClipPath(
//                   // clipper: CustomMenuClipper(),
//                   child: Container(
//                     width: screenWidth/5,
//                     height: screenHeight,
//                     alignment: Alignment.topRight,
//                     color: Colors.red,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 50,),
//                       child: AnimatedIcon(icon: AnimatedIcons.menu_close,
//                           size: 30,
//                           progress: _animationController.view),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
//
// class CustomMenuClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.white;
//
//     final width = size.width;
//     final height = size.height;
//
//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 8, 10, 16);
//     path.quadraticBezierTo(width - 1, height / 2 - 5, width, height / 2);
//     path.quadraticBezierTo(width + 1, height / 2 + 5, 10, height - 16);
//     path.quadraticBezierTo(0, height - 8, 0, height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
//
// }