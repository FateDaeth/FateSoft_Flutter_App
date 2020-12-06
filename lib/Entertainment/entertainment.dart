import 'package:fatesoft/app_theme.dart';
import 'package:flutter/material.dart';

class Entertainment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(children: <Widget>[
        SizedBox(height: size.height * 0.15),
        Container(
          child: Center(
            child: Text(
              "FATE-PLAYER",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: "VT323",
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.15),
        Container(
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "vidtbn1",
              backgroundColor: Colors.black,
              child: Icon(
                Icons.play_arrow,
                //size: ,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "Video_page");
              },
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          child: Text(
            "VIDEO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: "VT323",
            ),
          ),
        ),
        SizedBox(height: size.height * 0.15),
        Container(
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.black,
              child: Icon(
                Icons.audiotrack,
                //size: ,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "Audio_page");
              },
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          child: Text(
            "AUDIO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: "VT323",
            ),
          ),
        ),
      ]),
    );
  }
}
