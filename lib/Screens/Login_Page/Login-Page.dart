import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

String email;
String passwd;
var authc = FirebaseAuth.instance;

bool user = authc.currentUser.emailVerified;
var signIn;

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  var passController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.1),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: "VT323",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.23,
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
                    //controller: msgtextcontroller,
                    style: TextStyle(),
                    // ignore: non_constant_identifier_names
                    onChanged: (value) async {
                      email = value;
                    },
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: "Enter Your Email...",
                      border: InputBorder.none,
                    ),
                  ),
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
                    obscureText: true,
                    // ignore: non_constant_identifier_names
                    onChanged: (Value) {
                      passwd = Value;
                    },
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Colors.black87,
                      onPressed: () async {
                        try {
                          passController.clear();
                          signIn = await authc.signInWithEmailAndPassword(
                              email: email, password: passwd);
                          if (signIn.user.emailVerified == true) {
                            Navigator.popAndPushNamed(context, "nav");
                          } else {
                            Toast.show(
                                "Email Not Verified : " +
                                    authc.currentUser.email,
                                context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          }
                        } catch (e) {
                          Toast.show("Invalid Email", context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child: Text(
                        "SIGN IN",
                        style:
                            TextStyle(color: Colors.amber, fontFamily: "VT323"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "Registration_page"),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Logged in ..  ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          if (user == true) {
                            Navigator.popAndPushNamed(context, "nav");
                          } else {
                            Toast.show(
                                "Email Not Verified : " +
                                    authc.currentUser.email,
                                context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          }
                        } catch (e) {
                          {
                            Toast.show("No Account logged In ...  ", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          }
                        }
                      },
                      child: Text(
                        "Click here to Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
