/*
This is add device page
add radio_value.dart to this pages in folder config, this is used to define the value of radio button

install plugin in pubspec.yaml
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijtrackerflutter/config/constants.dart' show MENU_IMAGES_COLOR, PRIMARY_COLOR;
import 'package:ijtrackerflutter/config/radio_value.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  IconValue _icon = IconValue.man;

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
            'ADD DEVICE',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'IMEI',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Serial Number',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'GPS Name',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'GPS Description',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'GPS Phone Number',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Icon',
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
              SizedBox(
                height: 20,
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_walk,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Man',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.man,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.face,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Woman',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.woman,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.pregnant_woman,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Pregnant Woman',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.pregnant,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    ImageIcon(AssetImage('assets/images/elderly.png'),
                        color: MENU_IMAGES_COLOR, size: 35),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Elderly Person',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.elderly,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.child_care,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Child',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.child,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.accessible,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Disabled People',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.disability,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.pets,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Animal',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.pet,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_car,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Car',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.car,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.motorcycle,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Bike',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.bike,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_shipping,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Truck',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.truck,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              RadioListTile<IconValue>(
                activeColor: MENU_IMAGES_COLOR,
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_boat,
                      color: MENU_IMAGES_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Boat',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                value: IconValue.boat,
                groupValue: _icon,
                dense: true,
                onChanged: (IconValue? value) {
                  setState(() {
                    _icon = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                      Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_LONG);
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              )
            ],
          ),
        ));
  }
}
