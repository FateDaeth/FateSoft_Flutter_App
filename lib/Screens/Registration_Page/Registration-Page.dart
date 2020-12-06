import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: camel_case_types
class Registration_Page extends StatefulWidget {
  @override
  _Registration_PageState createState() => _Registration_PageState();
}

String email;
String passwd;

// ignore: camel_case_types
class _Registration_PageState extends State<Registration_Page> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authc = FirebaseAuth.instance;

    // ignore: non_constant_identifier_names

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
                  "SIGN UP",
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
                    controller: emailController,
                    style: TextStyle(),
                    // ignore: non_constant_identifier_names
                    onChanged: (value) {
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
                    onChanged: (value) {
                      passwd = value;
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
                          emailController.clear();
                          passController.clear();
                          var user = await authc.createUserWithEmailAndPassword(
                              email: email, password: passwd);
                          if (user.user.email != null) {
                            user.user.sendEmailVerification();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "Login_page", (route) => false);
                          }
                        } catch (e) {
                          Toast.show("Not A Valid Email", context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child: Text(
                        "SIGN UP",
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
                      "Already have an Account ? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, "Login_page"),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
