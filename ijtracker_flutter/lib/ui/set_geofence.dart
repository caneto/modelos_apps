/*
This is set geofence page

if you don't use _mapLoading variable, when the first time maps is loaded, you will see black screen for a while.

install plugin in pubspec.yaml
- google_maps_flutter => for google maps (https://pub.dev/packages/google_maps_flutter)
  add google maps api key to android manifest :
  <manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

  add google maps api key to ios/Runner/AppDelegate.swift
  import UIKit
  import Flutter
  import GoogleMaps

  @UIApplicationMain
  @objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GMSServices.provideAPIKey("YOUR KEY HERE")
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
  }


Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/geofence_model.dart';
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';

class SetGeofencePage extends StatefulWidget {
  @override
  _SetGeofencePageState createState() => _SetGeofencePageState();
}

class _SetGeofencePageState extends State<SetGeofencePage> {
  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(-4.207917, 112.1031403);

  Marker? _marker;

  // below variable is used to drawing circle area
  Circle? _circle;
  double _valRadius = 100;
  double _currentZoom = 4;

  LatLng? _position;

  bool _visible = false;

  // below variable used for dropdown
  List<String> _geofenceList = [];
  String _setFirst = "Don't Set";
  int _setIdx = -1;

  // below function is used to add custom marker to the maps
  late BitmapDescriptor _markerTower;
  void _setSourceAndDestinationIcons() async {
    _markerTower = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker.png');
  }

  void _addMarker() {
    _marker = Marker(
        markerId: MarkerId('geo'),
        flat: false,
        position: _position!,
        anchor: Offset(0.5, 1),
        rotation: 0,
        icon: _markerTower);

    _updateCircle();

    _controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _position!, zoom: 13)));

    _currentZoom = 13;
  }

  void _updateCircle() {
    _circle = Circle(
        circleId: CircleId('geo1'),
        fillColor: Color(0x40ff0000),
        strokeColor: Color(0),
        strokeWidth: 2,
        center: _position!,
        radius: _valRadius);
  }

  void _moveMarker() {
    _marker = Marker(
        markerId: MarkerId('geo'),
        flat: false,
        position: _position!,
        anchor: Offset(0.5, 1),
        rotation: 0,
        icon: _markerTower);

    if(_currentZoom < 10){
      _currentZoom = 13;
    }
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _position!, zoom: _currentZoom)));
  }

  //  dropdown menu
  DropdownButton<String> _buildDropdownButton() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _setFirst,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: (String? data) {
        setState(() {
          _setFirst = data!;
          if(_setFirst == "Don't Set"){
            _setIdx = -1;
            _marker=null;
            _circle=null;
          } else {
            for (int i = 0; i < geofenceData.length; i++) {
              if(_setFirst==geofenceData[i].geoName){
                _setIdx = i;
                _position = LatLng(geofenceData[i].geoLat, geofenceData[i].geoLong);
                _valRadius = geofenceData[i].geoRad;

                _moveMarker();
                _updateCircle();
              }
            }
          }
        });
        print(_setIdx.toString());
      },
      items: _geofenceList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(child: Text(value)),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    _setSourceAndDestinationIcons();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  GoogleMap _buildGoogleMap() {
    return GoogleMap(
        mapType: MapType.normal,
        trafficEnabled: false,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        mapToolbarEnabled: false,
        markers: Set.of((_marker != null) ? [_marker!] : []),
        circles: Set.of((_circle != null) ? [_circle!] : []),
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4,
        ),
        onCameraMove: _onGeoChanged,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

          // we use timer for this demo
          // in the real application, get the marker from database
          _timerDummy = Timer(Duration(milliseconds: 500), () {
            setState(() {
              _mapLoading = false;
              _visible = true;

              _geofenceList.add("Don't Set");

              List.generate(geofenceData.length, (index) {
                _geofenceList.add(geofenceData[index].geoName);
              });

              _setFirst = geofenceData[0].geoName;
              _setIdx = 0;
              // add marker
              _position = LatLng(geofenceData[0].geoLat, geofenceData[0].geoLong);
              _valRadius = geofenceData[0].geoRad;
              _addMarker();
            });
          });
        });
  }

  // when the Google Maps Camera is change, get the current position
  void _onGeoChanged(CameraPosition position) {
    _currentZoom = position.zoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'SET GEOFENCE',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Row(
                children: <Widget>[
                  Text('Geofence :'),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownButton(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  _buildGoogleMap(),
                  Visibility(
                    visible: _visible,
                    child: Positioned.fill(
                      bottom: 12,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) => PRIMARY_COLOR,
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )
                                ),
                              ),
                              onPressed: () {
                                startLoading(context, 'Update Geofence Success', true);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  (_mapLoading)?Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ):Container(),
                ],
              ),
            )
          ],
        )
    );
  }
}
