/*
This is default page
We used this pages first when we create new dart file
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart' show PRIMARY_COLOR;

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Default Page',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Container(
          child: Center(
            child: Text('This is Default Page'),
          ),
        )
    );
  }
}
