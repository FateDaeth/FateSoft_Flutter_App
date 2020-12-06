import 'package:fatesoft/Docker/Docker_Page.dart';
import 'package:fatesoft/Entertainment/entertainment.dart';
import 'package:fatesoft/Linux/Linux_Commands.dart';
import 'package:fatesoft/Screens/help_screen.dart';

import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/docker2.png',
      navigateScreen: Docker_Page(),
    ),
    HomeList(
      imagePath: 'assets/images/line2.png',
      navigateScreen: Linux_Commands(),
    ),
    HomeList(
      imagePath: 'assets/images/ent2.png',
      navigateScreen: Entertainment(),
    ),
    HomeList(
      imagePath: 'assets/images/chat.png',
      navigateScreen: HelpScreen(),
    ),
  ];
}
