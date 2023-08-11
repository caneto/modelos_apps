/*
This is setting pages

At GestureDetector Widget add attribute below
behavior: HitTestBehavior.translucent
With this, you can hit all space on GestureDetector
If you don't use above attribute, you still can direct to another pages when you click right on the images or text
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart' show PRIMARY_COLOR;
import 'package:ijtrackerflutter/ui/geofence.dart';
import 'package:ijtrackerflutter/ui/set_device.dart';
import 'package:ijtrackerflutter/ui/sound_setting.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            'SETTING',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetDevicePage()));
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(Icons.router, size: 40, color: PRIMARY_COLOR),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Set Device GPS', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF37474f), fontSize: 14),),
                                  SizedBox(height: 3,),
                                  Text('Add and set your device here', style: TextStyle(color: Color(0xFF78909c), fontSize: 13),),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(color: Colors.grey[300], height: 1),
                      ]
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GeofencePage()));
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(Icons.language, size: 40, color: PRIMARY_COLOR),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Geofence', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF37474f), fontSize: 14),),
                                  SizedBox(height: 3,),
                                  Text('Add geofence here', style: TextStyle(color: Color(0xFF78909c), fontSize: 13),),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(color: Colors.grey[300], height: 1),
                      ]
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SoundSettingPage()));
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(Icons.volume_up, size: 40, color: PRIMARY_COLOR),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Sound Setting', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF37474f), fontSize: 14),),
                                  SizedBox(height: 3,),
                                  Text('Set sound on or off here', style: TextStyle(color: Color(0xFF78909c), fontSize: 13),),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(color: Colors.grey[300], height: 1),
                      ]
                  )
              ),
            )
          ],
        )
    );
  }
}
