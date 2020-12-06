import 'package:fatesoft/Docker/Docker_Page.dart';
import 'package:fatesoft/Drawer_Home/drawer_user_controller.dart';
import 'package:fatesoft/Drawer_Home/home_drawer.dart';
import 'package:fatesoft/Drawer_Home_Screen/home_screen.dart';
import 'package:fatesoft/Entertainment/entertainment.dart';
import 'package:fatesoft/Linux/Linux_Commands.dart';
import 'package:fatesoft/Screens/help_screen.dart';

import 'package:fatesoft/app_theme.dart';

import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Docker) {
        setState(() {
          screenView = Docker_Page();
        });
      } else if (drawerIndex == DrawerIndex.Entertainment) {
        setState(() {
          screenView = Entertainment();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.LinuxTerminal) {
        setState(() {
          screenView = Linux_Commands();
        });
      } else {
        //do in your way......
      }
    }
  }
}
