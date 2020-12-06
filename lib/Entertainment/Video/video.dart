import 'package:flutter/material.dart';
import 'package:videos_player/model/control.model.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';

class Video extends StatefulWidget {
  Video({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideoPageState createState() => _VideoPageState();
}

@override
void initstate() {
  VideosPlayer(
    networkVideos: [
      new NetworkVideo(
          id: "2",
          name: "Elephant Dream",
          videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
          thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
          videoControl: new NetworkVideoControl(
            fullScreenByDefault: true,
          )),
    ],
  );
}

_displaydialogue(context) {}

class _VideoPageState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Container(
              child: Text(
                "VIDEOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  fontFamily: "VT323",
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(),
                color: Colors.red,
              ),
              child: VideosPlayer(
                networkVideos: [
                  new NetworkVideo(
                      id: "2",
                      name: "Elephant Dream",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                      videoControl: new NetworkVideoControl(
                        fullScreenByDefault: true,
                      )),
                  new NetworkVideo(
                      id: "3",
                      name: "Big Buck Bunny",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
                      videoControl: new NetworkVideoControl(autoPlay: true)),
                  new NetworkVideo(
                      id: "4",
                      name: "For Bigger Blazes",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
                  new NetworkVideo(
                      id: "5",
                      name: "For Bigger Escape",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"),
                  new NetworkVideo(
                      id: "6",
                      name: "For Bigger Fun",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg"),
                  new NetworkVideo(
                      id: "7",
                      name: "For Bigger Joyrides",
                      videoUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg"),
                ],
                playlistStyle: Style.Style2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
