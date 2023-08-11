/*
This is signup page

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:flutter/material.dart';
import 'package:ijtrackerflutter/config/constants.dart' show GRADIENT_BOTTOM, GRADIENT_TOP, PRIMARY_COLOR;
import 'package:ijtrackerflutter/ui/home.dart';
import 'package:ijtrackerflutter/ui/signin.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            // top blue background gradient
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            // set your logo here
            Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 10, 0, 0),
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/logo_dark.png', height: 35)),
            ListView(
              children: <Widget>[
                // create form sign up
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(
                      30, MediaQuery.of(context).size.height / 3.5 - 60, 30, 0),
                  color: Colors.white,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      width: MediaQuery.of(context).size.width - 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: PRIMARY_COLOR,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.grey[700])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(color: Colors.grey[700])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.grey[700])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey[700])),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) => PRIMARY_COLOR,
                                    ),
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'CREATE ACCOUNT',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                // create sign in link
                Center(
                  child: Wrap(
                    children: <Widget>[
                      Text('Already have an account? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninPage()));
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ));
  }
}
