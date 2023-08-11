/*
This is profile page

We used hero animation when user back to home page

install plugin in pubspec.yaml
- cached_network_image => to get image from network and cache it (https://pub.dev/packages/cached_network_image)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ijtrackerflutter/config/constants.dart'
    show CHARCOAL, GRADIENT_BOTTOM, GRADIENT_TOP, IMAGES_URL, MENU_IMAGES_COLOR;
import 'package:ijtrackerflutter/ui/edit_profile.dart';

import 'edit_profile_picture.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                    },
                    child: Text('Edit', style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin:
                EdgeInsets.only(top: (MediaQuery.of(context).size.height / 8)),
            child: Image.asset('assets/images/logo_dark.png', height: 30),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 3) -
                    MediaQuery.of(context).size.width / 5.5),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width / 5.5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: (MediaQuery.of(context).size.width / 5.5) - 4,
                      child: Hero(
                        tag: 'profilePicture',
                        child: ClipOval(
                            child: CachedNetworkImage(
                              placeholder: (context, url) {
                                return Container(
                                    width: 300,
                                    height: 300,
                                    child: CircularProgressIndicator());
                              },
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  'assets/images/icon_man.png',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fill,
                                );
                              },
                              imageUrl: IMAGES_URL,
                              fit: BoxFit.fill,
                              width: 300,
                              height: 300,
                            )),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.person, color: MENU_IMAGES_COLOR, size: 18,),
                          SizedBox(width: 20,),
                          Flexible(child: Text('Robert Steven', style: TextStyle(fontSize: 16, color: CHARCOAL, fontWeight: FontWeight.w600),))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.email, color: MENU_IMAGES_COLOR, size: 18,),
                          SizedBox(width: 20,),
                          Flexible(child: Text('robert.steven@ijtechnology.net', style: TextStyle(fontSize: 16, color: CHARCOAL, fontWeight: FontWeight.w600),))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.phone_android, color: MENU_IMAGES_COLOR, size: 18,),
                          SizedBox(width: 20,),
                          Flexible(child: Text('+62811888999', style: TextStyle(fontSize: 16, color: CHARCOAL, fontWeight: FontWeight.w600),))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('No')
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePicturePage()));
        },
        child: Text('Yes')
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text('Edit Profile Picture ?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
