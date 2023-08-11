import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ijtrackerflutter/config/constants.dart';

class DeviceModel {
  late int id;
  late String sn;
  late String devName;
  late String devDesc;
  late String devStatus;
  late Color color;
  late int stop;
  late int power;
  late String iconName;
  late var devIcon;
  late double gpsLat;
  late double gpsLong;
  late LatLng gpsPosition;
  late String speed;
  late String date;

  DeviceModel({required this.id, required this.sn, required this.devName, required this.devDesc, required this.devStatus, required this.color, required this.stop, required this.power, required this.iconName, required this.devIcon, required this.gpsLat, required this.gpsLong, required this.gpsPosition, required this.speed, required this.date});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sn = json['sn'];
    devName = json['devName'];
    devDesc = json['devDesc'];
    devStatus = json['devStatus'];
    color = json['color'];
    stop = json['stop'];
    power = json['power'];
    iconName = json['iconName'];
    devIcon = json['devIcon'];
    gpsLat = json['gpsLat'].toDouble();
    gpsLong = json['gpsLong'].toDouble();
    gpsPosition = json['gpsPosition'];
    speed = json['speed'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sn'] = this.sn;
    data['devName'] = this.devName;
    data['devDesc'] = this.devDesc;
    data['devStatus'] = this.devStatus;
    data['color'] = this.color;
    data['stop'] = this.stop;
    data['power'] = this.power;
    data['iconName'] = this.iconName;
    data['devIcon'] = this.devIcon;
    data['gpsLat'] = this.gpsLat;
    data['gpsLong'] = this.gpsLong;
    data['gpsPosition'] = this.gpsPosition;
    data['speed'] = this.speed;
    data['date'] = this.date;
    return data;
  }
}

List<DeviceModel> deviceData = [
  DeviceModel(
    id: 1,
    sn: '7018089100',
    devName: 'B 2455 UJD',
    devDesc: 'I put this GPS Tracker in my Honda car',
    devStatus: 'Online',
    color: Colors.lightGreen[700]!,
    stop: 0,
    power: 90,
    iconName: 'car',
    devIcon: Icons.directions_car,
    gpsLat: -6.168033,
    gpsLong: 106.900467,
    gpsPosition: LatLng(-6.168033, 106.900467),
    speed: '51 Km/h',
    date: '2020-07-15 09:02:31',
  ),
  DeviceModel(
    id: 2,
    sn: '7028129300',
    devName: 'My Mom',
    devDesc: 'I give this GPS Tracker to my mom',
    devStatus: 'Subscribe Expired',
    color: Colors.red[900]!,
    stop: 1,
    power: 73,
    iconName: 'elderly',
    devIcon: AssetImage('assets/images/elderly.png'),
    gpsLat: -6.164770,
    gpsLong: 106.900630,
    gpsPosition: LatLng(-6.164770, 106.900630),
    speed: '21 Km/h',
    date: '2020-07-14 19:23:27',
  ),
  DeviceModel(
    id: 3,
    sn: '4209995000',
    devName: 'B 4245 UTR',
    devDesc: 'I put this GPS Tracker in my motorcycle',
    devStatus: 'Power Saving',
    color: OCEAN,
    stop: 1,
    power: 9,
    iconName: 'bike',
    devIcon: Icons.motorcycle,
    gpsLat: -6.158637,
    gpsLong: 106.906376,
    gpsPosition: LatLng(-6.158637, 106.906376),
    speed: '34 Km/h',
    date: '2020-07-15 11:05:01',
  ),
];