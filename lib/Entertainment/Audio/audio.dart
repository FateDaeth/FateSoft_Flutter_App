import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  RotateImageState createState() => new RotateImageState();
}

class RotateImageState extends State with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  stopRotation() {
    animationController.stop();
  }

  startRotation() {
    animationController.repeat();
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  slider() {
    return Slider(
        activeColor: Colors.amberAccent,
        inactiveColor: Colors.black26,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  var arr = new List(100);
  var url;
  static var i = 0;
  static var j = 0;

  add(url) async {
    setState(() {
      arr[i] = url;
      i++;
    });
    await advancedPlayer.setUrl(arr[j]);
  }

  next() async {
    advancedPlayer.release();
    if (j >= i - 1) {
      setState(() {
        j = 0;
      });
      next1(context);
    }
    if (j < i) {
      setState(() async {
        j++;
        advancedPlayer.setUrl(arr[j]);
        advancedPlayer.resume();
      });
    }
  }

  next1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("You reached the end..Playing From Start"),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black87,
            title: Text(
              'Add Url',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.withOpacity(1)),
            ),
            content: TextField(
              onChanged: (value) async {
                setState(() {
                  url = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter Url Here",
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                prefixIcon: Icon(
                  Icons.link,
                  color: Colors.amber,
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.amber.withOpacity(1)),
                ),
                onPressed: () async {
                  await add(url);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  bool _play = false;

  final AudioPlayer audioPlayer = AudioPlayer();
  playLocal() async {
    int result = await audioPlayer.play(localFilePath, isLocal: true);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                //  padding: EdgeInsets.all(30),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 35.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          6.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    color: Colors.amber,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(50)),
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget _widget) {
                    return Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: _widget,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(33),
                    child: Image.network(
                        "https://cdn1.iconfinder.com/data/icons/shopping-hand-drawn-1/128/39-512.png"),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(45),
                child: Text(
                  "Audio",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    fontFamily: "VT323",
                  ),
                ),
              ),
            ),
            /* AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget _widget) {
                return Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              },
              child: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/shopping-hand-drawn-1/128/39-512.png"),
            ),*/
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.75,
                  left: MediaQuery.of(context).size.width * 0.45),
              child: IconButton(
                iconSize: 50,
                icon: Icon(Icons.stop),
                color: Colors.black87,
                onPressed: () {
                  stopRotation();
                  advancedPlayer.stop();
                  setState(() {
                    _play = false;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.75,
                  left: MediaQuery.of(context).size.width * 0.2),
              child: IconButton(
                icon: Icon(_play ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
                onPressed: () async {
                  if (_play == false) {
                    await advancedPlayer.resume();
                    startRotation();
                  } else {
                    await advancedPlayer.pause();
                    stopRotation();
                  }

                  setState(() {
                    _play = !_play;
                    if (_play) {
                      _play = true;
                      //stopRotation();
                    }
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.75,
                  left: MediaQuery.of(context).size.width * 0.7),
              child: IconButton(
                iconSize: 50,
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  next();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.65,
                  left: MediaQuery.of(context).size.width * 0.0),
              child: slider(),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.9,
                  left: MediaQuery.of(context).size.width * 0.8),
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.black38,
                child: Icon(
                  Icons.audiotrack,
                  color: Colors.amber,
                ),
                onPressed: () async {
                  String filePath = await FilePicker.getFilePath();

                  int status =
                      await advancedPlayer.play(filePath, isLocal: true);

                  if (status == 0) {
                    setState(() {
                      _play = true;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.9,
                  left: MediaQuery.of(context).size.width * 0.06),
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.black38,
                child: Icon(
                  Icons.playlist_add,
                  color: Colors.amber,
                ),
                onPressed: () => _displayDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
