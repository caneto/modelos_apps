/*
This is notification page
add shimmer loading to makes the loading more beautiful
add shimmer_loading.dart to this pages in folder reuseable

install plugin in pubspec.yaml
- flutter_html => to add html tag to Text widget (https://pub.dev/packages/flutter_html)
- shimmer_loading => to add beautiful loading (https://pub.dev/packages/shimmer)
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/notification_model.dart';
import 'package:ijtrackerflutter/ui/reuseable/shimmer_loading.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _loading = true;
  Timer? _timerDummy;

  @override
  void initState() {
    // this timer function is just for demo, so after 2 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NOTIFICATION',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
          child: (_loading == true)
              ? Center(child: ShimmerList())
              : ListView(
              children: List.generate(notificationData.length, (index) {
                return _buildNotif(index);
              })
          )
      ),
    );
  }

  Widget _buildNotif(index){
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Html(
                  data: notificationData[index].message,
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    notificationData[index].notifDate,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500]
                    ),
                    textAlign: TextAlign.left,
                  )
              ),
              Container(color: Colors.grey[300], height: 1),
            ]
        )
    );
  }
}
