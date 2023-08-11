/*
This is live location page (With full function)
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

- audioplayers => to play audio from assets (https://pub.dev/packages/audioplayers)
- geocoder => to get address from Latitude and Longitude (https://pub.dev/packages/geocoder)
- location => To get current phone location (https://pub.dev/packages/location)
  add this to ios Info.plist
  <key>NSLocationWhenInUseUsageDescription</key>
  <string>Application needs to access your current location</string>
  <key>NSLocationAlwaysUsageDescription</key>
  <string>Application needs to access your current location</string>

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:location/location.dart';

class LiveLocationPage extends StatefulWidget {
  @override
  _LiveLocationPageState createState() => _LiveLocationPageState();
}

class _LiveLocationPageState extends State<LiveLocationPage> {
  // need to install plugin "google_maps_flutter" in pubspec.yaml

  // google maps controller
  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  Marker? _marker;

  // latlng is for moving gps
  List<LatLng> _latlng = [];

  // latlng2 is for distance between phone position and device position
  List<LatLng> _latlng2 = [];

  // to drawing polylines of moving gps and distance
  Map<PolylineId, Polyline> _mapPolylines = {};

  // to show popup detail data information
  bool _infoDetail = true;

  // gps detail data information
  String _gpsStatus = 'Move';
  String _speed = deviceData[0].speed;
  String _stopTime = '';

  // enable and disable traffic when pressed traffic icon
  bool _isTraffic = false;

  // data of current location and current zoom
  double _currentZoom = 15;

  // first time open pages
  final LatLng _initialPosition = LatLng(-4.207917, 112.1031403);

  /* start enable sound when gps move
  - need to install plugin "audioplayers" in pubspec.yaml
  */
  AudioPlayer _audioPlayer = AudioPlayer();


  Future _startSoundLive() async {
    _stopSound();
    await _audioPlayer.play(AssetSource('sound/live.mp3'));
    _audioPlayer.onPlayerComplete.listen((event) {
      _stopSound();
    });
  }

  // to stop sound
  Future _stopSound() async {
    await _audioPlayer.stop();
  }

  // end enable sound when gps move

  /* start location and permission
  To enable phone current location
  - need to install plugin "location" in pubspec.yaml
  */
  bool _myLocationEnabled = false;
  LocationData? _currentLocation;
  Location _location = new Location();
  StreamSubscription<LocationData>? _locationSubscription;
  PermissionStatus? _status;

  Future<void> _askPermissionLocation() async {
    if (_status == PermissionStatus.denied) {
      _status = await _location.requestPermission();
      if (_status != PermissionStatus.granted) {
        return;
      } else {
        setState(() {
          _myLocationEnabled = true;
          _listenLocation();
        });
      }
    }
  }

  bool _callbackLoc = false;

  Future<void> _listenLocation() async {
    if (_callbackLoc == false) {
      _callbackLoc = true;
      _locationSubscription =
          _location.onLocationChanged.handleError((dynamic err) {
            if(_locationSubscription!=null){
              _locationSubscription?.cancel();
            }
          }).listen((LocationData _currentLocation) {
            this._currentLocation = _currentLocation;
            _showDistance();
          });
    }
  }

  // check if the permission is granted
  Future<void> _checkPermissionLocation() async {
    _status = await _location.hasPermission();
  }

  // end location and permission

  /* start distance calculation and draw polyline
  - this function is to calculate distance between phone location and gps location and draw polyline
  - need to install plugin "intl" in pubspec.yaml
  */
  String _distance = '';

  void _showDistance() {
    if (_currentLocation != null && _marker != null) {
      double distance = _calculateDistance(
          _currentLocation!.latitude,
          _currentLocation!.longitude,
          _marker!.position.latitude,
          _marker!.position.longitude);
      setState(() {
        this._distance = _formatNumber(distance * 1000);
        _latlng2.clear();
        _latlng2.add(LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!));
        _latlng2.add(LatLng(_marker!.position.latitude, _marker!.position.longitude));
        final PolylineId polylineId = PolylineId('2');
        final Polyline polyline = Polyline(
          polylineId: polylineId,
          visible: true,
          geodesic: true,
          width: 1,
          points: _latlng2,
          color: PRIMARY_COLOR,
        );
        _mapPolylines[polylineId] = polyline;
      });
    }
  }

  String _formatNumber(double distance) {
    String unit = 'm';
    if (distance < 1) {
      distance *= 1000;
      unit = 'mm';
    } else if (distance > 1000) {
      distance /= 1000;
      unit = 'km';
    }
    return distance.toStringAsFixed(3).replaceAll('.00', '') + unit;
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // end distance calculation and draw polylines

  // start custom marker
  late BitmapDescriptor _markerDirection;
  late BitmapDescriptor _markerStop;

  void _setSourceAndDestinationIcons() async {
    _markerDirection = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/direction.png');
    _markerStop = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/stop.png');
  }

  // end custom marker

  /* start get address
  This function is to get address based on the position of Latitude and Longitude
  - need to install plugin "geocoder" in pubspec.yaml
  */
  String _address = '';

  Future<void> _getAddress(lat, long) async {
    geo.placemarkFromCoordinates(lat, long).then((placemarks) {
      var output;
      if (placemarks.isNotEmpty) {
        output = placemarks[0].toJson();
        setState(() {
          _address = output['street']+', '+output['subLocality']+', '+output['locality']+', '+output['subAdministrativeArea']+', '+output['administrativeArea']+', '+output['postalCode']+', '+output['country'];
        });
      } else {
        setState(() {
          _address = 'result not found';
        });
      }
    });
  }

  // end get address

  // add marker
  void _addMarker(double lat, double lng) {
    LatLng position = LatLng(lat, lng);

    // set initial polyline
    _latlng.add(position);
    final PolylineId polylineId = PolylineId('1');
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      visible: true,
      width: 2,
      points: _latlng,
      color: MAPS_IMAGES_COLOR,
    );
    _mapPolylines[polylineId] = polyline;

    // set initial marker
    _marker = Marker(
      markerId: MarkerId('live'),
      flat: true,
      position: position,
      anchor: Offset(0.5, 0.5),
      onTap: () {
        setState(() {
          _infoDetail = true;
        });
      },
      rotation: 25,
      icon: _markerDirection,
    );

    _getAddress(lat, lng);

    CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 15));

    this._controller.moveCamera(u2).then((void v) {
      _check(u2, this._controller);
    });
  }

  // end add marker

  /* start additional function for camera update
  - we get this function from the internet
  - if we don't use this function, the camera will not work properly (Zoom to marker sometimes not work)
  */
  void _check(CameraUpdate u, GoogleMapController c) async {
    c.moveCamera(u);
    _controller.moveCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      _check(u, c);
  }
  // end additional function for camera update

  /* start appbar action menu
  - this function is just for demo
  - this function will change the marker to Stop from Move
  */
  List<String> _choices = <String>['Change to Stop'];

  void _choiceAction(String choice) {
    if (choice == 'Change to Stop') {
      setState(() {
        // update the detail information data
        _gpsStatus = 'Stop';
        _speed = '0 Km/h';
        _stopTime = '18 minutes';

        _infoDetail = true;

        _marker = Marker(
          markerId: MarkerId('live'),
          flat: false,
          position: _marker!.position,
          anchor: Offset(0.5, 0.5),
          rotation: 0,
          onTap: () {
            _infoDetail = true;
          },
          icon: _markerStop,
        );

        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _marker!.position, zoom: _currentZoom)));
      });

      _startSoundLive();
    }
  }

  // end appbar action menu

  @override
  void initState() {
    _checkPermissionLocation().then((val) {
      if (_status == PermissionStatus.granted) {
        setState(() {
          _myLocationEnabled = true;
        });
        _listenLocation();
      } else {
        _askPermissionLocation();
      }
    });

    _setSourceAndDestinationIcons();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    _stopSound();
    if (_locationSubscription != null) {
      _locationSubscription?.cancel();
    }
    super.dispose();
  }

  // build google maps to used inside widget
  GoogleMap _buildGoogleMap() {
    return GoogleMap(
        mapType: MapType.normal,
        trafficEnabled: _isTraffic,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        myLocationEnabled: _myLocationEnabled,
        mapToolbarEnabled: true,
        markers: Set.of((_marker != null) ? [_marker!] : []),
        polylines: Set<Polyline>.of(_mapPolylines.values),
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4,
        ),
        onCameraMove: _onGeoChanged,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

          // we use timer for this demo
          // in the real application, get the position from database
          // Get the marker from API and add the marker here
          _timerDummy = Timer(Duration(seconds: 1), () {
            setState(() {
              _mapLoading = false;
              _addMarker(deviceData[0].gpsLat, deviceData[0].gpsLong);
            });
          });
        },
        onTap: (position) {
          /*
          When user click on the maps, the gps position will change
          - This function is just for demo, you can customize the function
          */
          setState(() {
            _infoDetail = false;
            // change detail data information
            _gpsStatus = 'Move';
            _speed = deviceData[0].speed;
            _stopTime = '';

            // change the marker position based on when user click the maps
            _marker = Marker(
              markerId: MarkerId('live'),
              flat: true,
              position: position,
              anchor: Offset(0.5, 0.5),
              rotation: 25,
              onTap: () {
                _infoDetail = true;
              },
              icon: _markerDirection,
            );

            // draw the polyline of moving gps
            _latlng.add(position);
            final PolylineId polylineId = PolylineId('1');
            final Polyline polyline = Polyline(
              polylineId: polylineId,
              visible: true,
              width: 2,
              points: _latlng,
              color: MAPS_IMAGES_COLOR,
            );
            _mapPolylines[polylineId] = polyline;

            // move the screen to the center of marker
            _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: _currentZoom)));
          });

          _startSoundLive();

          _getAddress(position.latitude, position.longitude);

          // get phone location and draw the polyline
          if (_status == PermissionStatus.granted) {
            _showDistance();
          }
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
            'LIVE LOCATION',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _choiceAction,
              itemBuilder: (BuildContext context) {
                return _choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  _buildGoogleMap(),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          color: Color(0xFFFFFFFF),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                deviceData[0].devIcon,
                                color: MAPS_IMAGES_COLOR,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                _gpsStatus,
                                style: TextStyle(
                                    fontSize: 12, color: MAPS_IMAGES_COLOR),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  (_distance == '')
                      ? Wrap()
                      : Positioned.fill(
                    top: 12,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        color: Color(0x950a4349),
                        child: Text(
                          'Distance : ' + _distance,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {
                        _controller.animateCamera(
                            CameraUpdate.newCameraPosition(CameraPosition(
                                target: _marker!.position, zoom: _currentZoom)));
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
                  Positioned(
                    bottom: 84,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {
                        if (_currentLocation == null) {
                          _askPermissionLocation();
                        } else {
                          _controller.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!), zoom: 15)));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 36,
                        height: 36,
                        color: Color(0x99FFFFFF),
                        child: Icon(
                          Icons.phone_android,
                          color: MAPS_IMAGES_COLOR,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 128,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {
                        //_gpsBloc.add(UpdateTraffic());
                        setState(() {
                          _isTraffic = (_isTraffic) ? false : true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 36,
                        height: 36,
                        color: Color(0x99FFFFFF),
                        child: Icon(
                          Icons.traffic,
                          color: MAPS_IMAGES_COLOR,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 14,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: (_infoDetail)
                          ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Wrap(children: <Widget>[
                          Card(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Wrap(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/speed.png',
                                        height: 14,
                                        color: MAPS_IMAGES_COLOR,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        _speed,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Wrap(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 13,
                                        color: MAPS_IMAGES_COLOR,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        deviceData[0].date,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Visibility(
                                    visible:
                                    (_stopTime == '') ? false : true,
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/stop.png',
                                          height: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          _stopTime,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      )
                          : Wrap(),
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
            ),
            (_address == '')
                ? Wrap()
                : Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  _address,
                  style: TextStyle(fontSize: 13),
                )),
          ],
        ));
  }
}
