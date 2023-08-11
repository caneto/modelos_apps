/*
This is about page

install plugin in pubspec.yaml
- package_info (https://pub.dev/packages/package_info)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart' show CHARCOAL, PRIMARY_COLOR;
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '1.0.1';

  Future<void> _getSystemDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  void initState() {
    _getSystemDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ABOUT',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Image.asset('assets/images/logo_light.png',
                      height: 40)),
              SizedBox(
                height: 50,
              ),
              Text(
                'App Version',
                style: TextStyle(
                    fontSize: 14,
                    color: CHARCOAL
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _version,
                style: TextStyle(
                    fontSize: 14,
                    color: CHARCOAL
                ),
              ),
            ],
          ),
        )
    );
  }
}
