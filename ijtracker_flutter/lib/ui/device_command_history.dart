/*
This is device command history page
add shimmer loading to makes the loading more beautiful
add shimmer_loading.dart to this pages in folder reuseable

install plugin in pubspec.yaml
- shimmer_loading => to add beautiful loading (https://pub.dev/packages/shimmer)
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart' show PRIMARY_COLOR;
import 'package:ijtrackerflutter/model/device_command_history_model.dart';
import 'package:ijtrackerflutter/ui/reuseable/shimmer_loading.dart';

class DeviceCommandHistoryPage extends StatefulWidget {
  @override
  _DeviceCommandHistoryPageState createState() => _DeviceCommandHistoryPageState();
}

class _DeviceCommandHistoryPageState extends State<DeviceCommandHistoryPage> {
  bool _loading = true;
  Timer? _timerDummy;

  @override
  void initState() {
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
          'DEVICE COMMAND HISTORY',
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
              children: List.generate(deviceCommandHistoryData.length, (index) {
                return _buildCommandHistory(index);
              })
          )
      ),
    );
  }

  Widget _buildCommandHistory(index){
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  deviceCommandHistoryData[index].action,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  deviceCommandHistoryData[index].message,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    deviceCommandHistoryData[index].date+' | '+deviceCommandHistoryData[index].webAndroidIos,
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
