/*
This is set device page
this pages is used to change your default device
add shimmer loading to makes the loading more beautiful
add shimmer_loading.dart to this pages in folder reuseable

At GestureDetector Widget add attribute below
behavior: HitTestBehavior.translucent
With this, you can hit all space on GestureDetector
If you don't use above attribute, you still can direct to another pages when you click right on the images or text

install plugin in pubspec.yaml
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)
- shimmer_loading => to add beautiful loading (https://pub.dev/packages/shimmer)
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:ijtrackerflutter/ui/add_device.dart';
import 'package:ijtrackerflutter/ui/reuseable/shimmer_loading.dart';

class SetDevicePage extends StatefulWidget {
  @override
  _SetDevicePageState createState() => _SetDevicePageState();
}

class _SetDevicePageState extends State<SetDevicePage> {
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
          'SET DEVICE',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Select to set device : ',
                style: TextStyle(color: Colors.grey[600]),
              )),
          Expanded(
            child: (_loading == true)
                ? Center(child: ShimmerList())
                : ListView(
                padding: EdgeInsets.only(bottom: 12),
                children: List.generate(deviceData.length, (index) {
                  return _buildDeviceList(index);
                })
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDevicePage()));
        },
        child: Icon(Icons.add),
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }

  Widget _buildDeviceList(index){
    return GestureDetector(
      onTap: () {
        (index==0)
        ? Fluttertoast.showToast(
            msg: 'Already set this device',
            toastLength: Toast.LENGTH_LONG)
        : _showAlertDialog(context);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: <Widget>[
                      (deviceData[index].iconName=='elderly')
                      ? ImageIcon(
                        deviceData[index].devIcon,
                        color: MENU_IMAGES_COLOR,
                        size: 28,
                      )
                      : Icon(
                        deviceData[index].devIcon,
                        color: MENU_IMAGES_COLOR,
                        size: 28,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        deviceData[index].stop==0?'Move':'Stop',
                        style: TextStyle(
                            fontSize: 12, color: CHARCOAL),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        deviceData[index].devName+' ['+deviceData[index].sn+']',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: CHARCOAL),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 5, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: deviceData[index].color),
                                borderRadius:
                                BorderRadius.circular(30)),
                            padding:
                            EdgeInsets.fromLTRB(7, 2, 7, 2),
                            child: Text(deviceData[index].devStatus,
                                maxLines: 1,
                                style: TextStyle(
                                    color: deviceData[index].color,
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                'Battery : '+deviceData[index].power.toString()+'%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: deviceData[index].power<20?Colors.red:CHARCOAL),
                              )),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            deviceData[index].devDesc,
                            style: TextStyle(
                                fontSize: 13,
                                color: CHARCOAL),
                          )),
                    ],
                  ),
                ),
                index==0
                    ? Icon(Icons.check, color: PRIMARY_COLOR,)
                    : Wrap()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(color: Colors.grey[300], height: 1),
          ],
        ),
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
          Navigator.of(context, rootNavigator: true).pop();
          Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_LONG);
        },
        child: Text('Yes')
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text('Set this device ?'),
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
