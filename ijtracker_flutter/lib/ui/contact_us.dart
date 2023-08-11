/*
This is contact us page

install plugin in pubspec.yaml
- url_launcher => used for call function and direct to email (https://pub.dev/packages/url_launcher)
 */

import 'package:flutter/material.dart';
import 'package:ijtrackerflutter/config/constants.dart'
    show
        CHARCOAL,
        GRADIENT_BOTTOM,
        GRADIENT_TOP,
        MENU_IMAGES_COLOR,
        PRIMARY_COLOR;
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 11, 0, 0),
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/logo_dark.png', height: 35)),
            ListView(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(
                      30, MediaQuery.of(context).size.height / 6, 30, 0),
                  color: Colors.white,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      width: MediaQuery.of(context).size.width - 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: PRIMARY_COLOR,
                                  size: 28,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'CONTACT US',
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
                                  borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Colors.grey[700], fontSize: 13)),
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
                                  borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.grey[700], fontSize: 13)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                                ),
                                labelText: 'Message',
                                labelStyle: TextStyle(
                                    color: Colors.grey[700], fontSize: 13)),
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
                                    startLoading(context, 'Success', true);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'SUBMIT',
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
                  height: 30,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _sendEmail('cs@email.com');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.email, color: MENU_IMAGES_COLOR),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Email',
                                    style: TextStyle(color: CHARCOAL),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'cs@email.com',
                                    style: TextStyle(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _makePhoneCall('+62811888888');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.phone_android, color: MENU_IMAGES_COLOR),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Phone',
                                    style: TextStyle(color: CHARCOAL),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '+62 811 888 888',
                                    style: TextStyle(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
    ));
  }

  Future<void> _sendEmail(String email) async {
    Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}
