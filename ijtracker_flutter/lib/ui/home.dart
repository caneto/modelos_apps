/*
This is home page
divided to 4 part
- appBar()
- _buildTop()
- _buildDeviceStatus()
- _buildGridMenu()

We used hero animation when user click to profile page

install plugin in pubspec.yaml
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)
- cached_network_image => to get image from network and cache it (https://pub.dev/packages/cached_network_image)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:ijtrackerflutter/ui/about.dart';
import 'package:ijtrackerflutter/ui/contact_us.dart';
import 'package:ijtrackerflutter/ui/default.dart';
import 'package:ijtrackerflutter/ui/detail_info.dart';
import 'package:ijtrackerflutter/ui/device_command_history.dart';
import 'package:ijtrackerflutter/ui/center_number.dart';
import 'package:ijtrackerflutter/ui/edit_device.dart';
import 'package:ijtrackerflutter/ui/history_gps.dart';
import 'package:ijtrackerflutter/ui/live_location.dart';
import 'package:ijtrackerflutter/ui/map_all_devices.dart';
import 'package:ijtrackerflutter/ui/notification.dart';
import 'package:ijtrackerflutter/ui/profile.dart';
import 'package:ijtrackerflutter/ui/set_device.dart';
import 'package:ijtrackerflutter/ui/set_geofence.dart';
import 'package:ijtrackerflutter/ui/set_gps_time_interval.dart';
import 'package:ijtrackerflutter/ui/setting.dart';
import 'package:ijtrackerflutter/ui/signin.dart';
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // this function is used for exit the application, user must click back button two times
  DateTime? _currentBackPressTime;
  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Press BACK again to Exit', toastLength: Toast.LENGTH_LONG);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Container(
            child: Column(
              children: <Widget>[
                _buildTop(),
                _buildDeviceStatus(),
                _buildGridMenu()
              ],
            ),
          ),
        ));
  }

  /*
  if there is a notification (more than 0) use this function
  if there is no notification (0), use just Icon notification
   */
  Stack _customNotifIcon(int count) {
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: ASSENT_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  // build appbar
  AppBar _appBar() {
    return AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo_dark.png', height: 20),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            }),
        actions: <Widget>[
          IconButton(
              icon: _customNotifIcon(8),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotificationPage()));
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              })
        ]);
  }

  Container _buildTop() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Hero(
              tag: 'profilePicture',
              child: ClipOval(
                  child: CachedNetworkImage(
                    placeholder: (context, url) {
                      return Container(
                          width: 50, height: 50, child: CircularProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        'assets/images/icon_man.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      );
                    },
                    imageUrl: IMAGES_URL,
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  )
              ),
            ),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                      child: Text(
                        'Robert Steven',
                        style: TextStyle(
                            color: CHARCOAL,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SetDevicePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(top: 4),
                                child: Icon(
                                  deviceData[0].devIcon,
                                  color: MENU_IMAGES_COLOR,
                                  size: 28,
                                )),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: OCEAN),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.fromLTRB(6, 4, 6, 0),
                                padding: EdgeInsets.fromLTRB(9, 5, 9, 3),
                                child: Text(deviceData[0].devName+' | '+deviceData[0].sn,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: OCEAN,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9),)
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninPage()));
            },
            child: Text(
                'Log Out',
                style: TextStyle(color: CHARCOAL, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Container _buildDeviceStatus() {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(deviceData[0].devStatus+' | ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
            Text('Battery : '+deviceData[0].power.toString()+'%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ],
        ),
      )
    );
  }

  Flexible _buildGridMenu(){
    return Flexible(
        child: GridView.count(
          primary: false,
          childAspectRatio: 1.25,
          shrinkWrap: true,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          children: <Widget>[
            _buildMenu('Map\nAll Devices', Icons.map, true, 'route'),
            _buildMenu('Live Location', Icons.room, true, 'route'),
            _buildMenu('History Location', Icons.history, true, 'route'),
            _buildMenu('Set Geofence', Icons.language, true, 'route'),
            _buildMenu('Detail Info', Icons.info, true, 'route'),
            _buildMenu('Edit Device', Icons.create, true, 'route'),
            _buildMenu('Change\nCenter Number', Icons.smartphone, true, 'route'),
            _buildMenu('Disabled Menu', Icons.vpn_key, false, 'route'),
            _buildMenu('Set GPS\nTime Interval', Icons.hourglass_empty, true, 'route'),
            _buildMenu('Restart Device', Icons.refresh, true, 'dialog'),
            _buildMenu('Power Saving\nMode', Icons.battery_charging_full, true, 'dialog'),
            _buildMenu('Normal Mode', Icons.flash_on, true, 'dialog'),
            _buildMenu('Shutdown\nDevice', Icons.power_settings_new, true, 'dialog'),
            _buildMenu('Device\nCommand History', Icons.assignment, true, 'route'),
            _buildMenu('Contact Us', Icons.email, true, 'route'),
          ],
        ));
  }

  GestureDetector _buildMenu(String menuTitle, IconData menuImage, bool menuEnable, String menuTag){
    return GestureDetector(
        onTap: () {
          if (menuEnable == true) {
            StatefulWidget menuPage = DefaultPage();
            String alertMessage = 'Are you sure';
            if(menuTitle == 'Map\nAll Devices'){
              menuPage = MapAllDevicesPage();
            } else if(menuTitle == 'Live Location'){
              menuPage = LiveLocationPage();
            } else if(menuTitle == 'History Location'){
              menuPage = HistoryPage();
            } else if(menuTitle == 'Set Geofence'){
              menuPage = SetGeofencePage();
            } else if(menuTitle == 'Detail Info'){
              menuPage = DetailInfoPage();
            } else if(menuTitle == 'Edit Device'){
              menuPage = EditDevicePage();
            } else if(menuTitle == 'Change\nCenter Number'){
              menuPage = EditCenterNumberPage();
            } else if(menuTitle == 'Device\nCommand History'){
              menuPage = DeviceCommandHistoryPage();
            } else if(menuTitle == 'Set GPS\nTime Interval'){
              menuPage = SetIntervalGpsPage();
            } else if(menuTitle == 'Contact Us'){
              menuPage = ContactUsPage();
            } else if(menuTitle == 'Restart Device'){
              alertMessage = 'Restart device ?';
            } else if(menuTitle == 'Power Saving\nMode'){
              alertMessage = 'Power saving mode will not send GPS data, are you sure ?';
            } else if(menuTitle == 'Normal Mode'){
              alertMessage = 'Normal mode ?';
            } else if(menuTitle == 'Shutdown\nDevice'){
              alertMessage = 'Shutdown device ?';
            }
            if (menuTag == 'route') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage));
            } else {
              _showAlertDialog(alertMessage);
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[100]!, width: 0.5),
              color: (menuEnable==true)?Colors.white:Colors.grey[50]),
          padding: EdgeInsets.all(8),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      menuImage,
                      color: (menuEnable==true)?MENU_IMAGES_COLOR:Colors.blueGrey[300],
                      size: 30,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        menuTitle,
                        style: TextStyle(
                          color: (menuEnable==true)?CHARCOAL:Colors.blueGrey[300],
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ])),
        ));
  }

  // create alert dialog widget
  _showAlertDialog(alertMessage) {
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
          startLoading(context, 'Success', false);
        },
        child: Text('Yes')
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(alertMessage),
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
