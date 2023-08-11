/*
This is detail info page

install plugin in pubspec.yaml
- url_launcher => used for call function (https://pub.dev/packages/url_launcher)
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailInfoPage extends StatefulWidget {
  @override
  _DetailInfoPageState createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  bool _hasCallSupport = false;

  @override
  void initState() {
    super.initState();

    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '+62811456789')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DETAIL INFO',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'GPS Name',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      deviceData[0].devName,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    Wrap(
                      children: <Widget>[
                        Icon(deviceData[0].devIcon, size: 28, color: MENU_IMAGES_COLOR),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightGreen[700]!),
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 3),
                          child: Text(deviceData[0].devStatus,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.lightGreen[700], fontSize: 14)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'GPS Description',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  deviceData[0].devDesc,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'GPS Phone Number',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '+62811456789',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(_hasCallSupport){
                          _makePhoneCall('+62811456789');
                        }
                      },
                      child: Text(
                        'Call',
                        style: TextStyle(
                            fontSize: 16,
                            color: PRIMARY_COLOR,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Devices can only be called by the center number',
                  style: TextStyle(fontSize: 12, color: OCEAN),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Serial Number',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  deviceData[0].sn,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Battery',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  deviceData[0].power.toString()+' %',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Interval GPS',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '20 second',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Status',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Subscribe',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Subscribe Date',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '21 February 2020',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Upgrade Date',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '21 February 2020',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Expired Date',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '21 February 2021',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
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
