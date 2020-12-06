import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Linux_Commands extends StatefulWidget {
  @override
  _Linux_CommandsState createState() => _Linux_CommandsState();
}

var msgout = '';
var passController = TextEditingController();
var command;

// ignore: deprecated_member_use
final databaseReference = FirebaseFirestore.instance;
//record creation
createrecord(msg) async {
  await databaseReference
      .collection("Linux")
      // ignore: deprecated_member_use
      .document("cmdresults")
      // ignore: deprecated_member_use
      .setData({
    'output': msg,
  });
}

//http API Server
web(command) async {
  var message;
  try {
    var url = "http://192.168.43.171/cgi-bin/linux.py?x=$command";
    var result = await http.get(url);

    message = result.body;

    //return message;
  } catch (_) {
    BotToast.showText(text: "Error in server or Incorrect url");
  }
  createrecord(message);
  //print(mycmd);
}

class _Linux_CommandsState extends State<Linux_Commands> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            SizedBox(height: size.height * 0.1),
            Center(
              child: Text(
                "Linux Commands",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "VT323",
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff64B6FF),
                    Color(0xff64B6FF),
                    Color(0xFFFFFFFF)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller: passController,
                style: TextStyle(),

                // ignore: non_constant_identifier_names
                onChanged: (value) {
                  command = value;
                },
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: "Enter The Commands",
                  icon: Icon(
                    Icons.near_me,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: Colors.black87,
                  onPressed: () async {
                    try {
                      passController.clear();
                      web(command);
                    } catch (e) {
                      Toast.show("Not A Valid Request", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
                  },
                  child: Text(
                    "Enter",
                    style: TextStyle(color: Colors.amber, fontFamily: "VT323"),
                  ),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: databaseReference.collection("Linux").snapshots(),
                builder: (context, snapshot) {
                  try {
                    var dop = snapshot.data.docs;
                    for (var d in dop) {
                      msgout = d.data()['output'];
                    }
                  } catch (e) {}

                  return !snapshot.hasData
                      ? CircularProgressIndicator()
                      : SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.05,
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black87,
                                border: Border.all(color: Colors.black)),
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  child: new SingleChildScrollView(
                                    child: new Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.05,
                                      child: new Text(
                                        "root@localhost-# - " + msgout,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                  //Text("$msg");

                  // print(y);
                })
          ]),
        ],
      ),
    );
  }
}
