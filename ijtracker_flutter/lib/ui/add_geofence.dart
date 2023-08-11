/*
This is add geofence page

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
import 'package:ijtrackerflutter/config/constants.dart' show CHARCOAL, MAPS_IMAGES_COLOR, PRIMARY_COLOR;

class AddGeofencePage extends StatefulWidget {
  @override
  _AddGeofencePageState createState() => _AddGeofencePageState();
}

class _AddGeofencePageState extends State<AddGeofencePage> {
  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(-4.207917, 112.1031403);

  Marker? _marker;

  // below variable is used to drawing circle area
  Circle? _circle;
  double _valRadius = 100;
  double _currentZoom = 15;

  LatLng? _position;

  // below function is used to add custom marker to the maps
  late BitmapDescriptor _markerTower;
  void _setSourceAndDestinationIcons() async {
    _markerTower = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker.png');
  }

  void _addMarker(double lat, double lng){
    // add marker
    _position = LatLng(lat, lng);
    _marker = Marker(
        markerId: MarkerId('geo'),
        flat: false,
        position: _position!,
        anchor: Offset(0.5, 1),
        rotation: 0,
        icon: _markerTower,
        draggable: true,
        onDragEnd: (pos){
          setState(() {
            _position = pos;
            _moveMarker();
            _updateCircle();
          });
        }
    );

    // update the area of geofence
    _updateCircle();

    // move the screen to the center of marker
    CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: _position!, zoom: 15));
    this._controller.moveCamera(u2).then((void v){
      _check(u2,this._controller);
    });
  }

  /* start additional function for camera update
  - we get this function from the internet
  - if we don't use this function, the camera will not work properly (Zoom to marker sometimes not work)
  */
  void _check(CameraUpdate u, GoogleMapController c) async {
    c.moveCamera(u);
    _controller.moveCamera(u);
    LatLngBounds l1=await c.getVisibleRegion();
    LatLngBounds l2=await c.getVisibleRegion();

    if(l1.southwest.latitude==-90 ||l2.southwest.latitude==-90)
      _check(u, c);
  }

  // move the marker
  void _moveMarker(){
    _marker = Marker(
        markerId: MarkerId('geo'),
        flat: false,
        position: _position!,
        anchor: Offset(0.5, 1),
        rotation: 0,
        icon: _markerTower,
        draggable: true,
        onDragEnd: (pos){
          setState(() {
            _position = pos;
            _moveMarker();
            _updateCircle();
          });
        }
    );

    // animate the camera to the center of marker
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _position!,
        zoom: _currentZoom)));
  }

  void _updateCircle(){
    _circle = Circle(
        circleId: CircleId('geo1'),
        fillColor: Color(0x40ff0000),
        strokeColor: Color(0),
        strokeWidth: 2,
        center: _position!,
        radius: _valRadius
    );
  }

  _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Cancel')
    );
    Widget continueButton = TextButton(
        onPressed: () {
          _startLoading();
        },
        child: Text('Save')
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'Geofence Name',
                labelStyle:
                TextStyle(color: Colors.grey[700], fontSize: 13)),
          ),
          TextField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'Geofence Description',
                labelStyle:
                TextStyle(color: Colors.grey[700], fontSize: 13)),
          ),
        ],
      ),
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
          // in the real application, get the position from database
          _timerDummy = Timer(Duration(seconds: 1), () {
            setState(() {
              _mapLoading = false;
              double lat = -6.168033;
              double lng = 106.900467;
              _addMarker(lat, lng);
            });
          });
        },
        onTap: (pos) {
          setState(() {
            _position = pos;
            _moveMarker();
            _updateCircle();
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
            'ADD GEOFENCE',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(),
            Positioned.fill(
              top: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                  color: Color(0xCCe75f3f),
                  child: Text(
                    'Radius : '+_valRadius.toInt().toString()+'m',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 16,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  color: Colors.white,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: MAPS_IMAGES_COLOR,
                      inactiveTrackColor:
                      MAPS_IMAGES_COLOR.withAlpha(150),
                      trackHeight: 1,
                      thumbColor: MAPS_IMAGES_COLOR,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 6),
                      overlayColor: MAPS_IMAGES_COLOR.withAlpha(32),
                    ),
                    child: Slider(
                      value: _valRadius,
                      min: 100,
                      max: 5000,
                      onChanged: (newValue) {
                        setState(() {
                          _valRadius = newValue.round().toDouble();
                          _updateCircle();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: GestureDetector(
                onTap: (){
                  _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                      target: _marker!.position,
                      zoom: _currentZoom)));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 36,
                  height: 36,
                  color: Color(0x99FFFFFF),
                  child: Icon(
                    Icons.my_location,
                    color: MAPS_IMAGES_COLOR,
                    size: 26,
                  ),
                ),
              ),
            ),
            Positioned.fill(
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
                        _showAlertDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Done',
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
            (_mapLoading)?Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[100],
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):Container(),
          ],
        )
    );
  }

  /*
  start dummy loading and success
  This function is just for demo
  dummy loading and then show success popup
   */
  void _startLoading(){
    _progressDialog(context);
    Timer(Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context, rootNavigator: true).pop();

      _buildShowDialog(context);
    });
  }

  Future _progressDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Future _buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)), //this right here
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Add Geofence Success',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: CHARCOAL),
                    ),
                    SizedBox(
                      height: 20,
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
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context); // close popup

                            FocusScope.of(context).unfocus(); // hide keyboard when press button
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
                            child: Text(
                              'OK',
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
              ),
            ),
          );
        });
  }
  // end dummy loading and success
}
