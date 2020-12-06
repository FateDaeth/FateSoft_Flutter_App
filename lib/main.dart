import 'package:fatesoft/Docker/Docker_Image/Docker_Images_Page.dart';
import 'package:fatesoft/Docker/Docker_Image/Docker_Images_Pull_Page.dart';
import 'package:fatesoft/Docker/Docker_Launch/Delete_Docker.dart';
import 'package:fatesoft/Docker/Docker_Launch/Docker_Launch_Config.dart';
import 'package:fatesoft/Docker/Docker_Launch/Docker_Launch_Details.dart';
import 'package:fatesoft/Entertainment/Audio/audio.dart';
import 'package:fatesoft/Entertainment/Video/video.dart';
import 'package:fatesoft/Linux/Linux_Commands.dart';
import 'package:fatesoft/Screens/Login_Page/Login-Page.dart';
import 'package:fatesoft/Screens/Registration_Page/Registration-Page.dart';
import 'package:fatesoft/Screens/Start_Page/Start-page.dart';
import 'package:fatesoft/navigation_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: "start-page",
      routes: {
        "nav": (context) => NavigationHomeScreen(),
        "start-page": (context) => Start_Page(),
        "Login_page": (context) => Login_Page(),
        "Registration_page": (context) => Registration_Page(),
        "Audio_page": (context) => Audio(),
        "Video_page": (context) => Video(),
        "Docker_Images_page": (context) => Docker_Images_Page(),
        "Docker_Images_Pull_page": (context) => Docker_Images_Pull_Page(),
        "Docker_Launch_Config": (context) => Docker_Launch_Config(),
        "Docker_Launch_Details": (context) => Docker_Launch_Details(),
        "Linux_Commands": (context) => Linux_Commands(),
        "Delete_Docker": (context) => Delete_Docker(),
      },
    ),
  );
}
