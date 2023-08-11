/*
This is map all devices
if you don't use _mapLoading variable, when the first time maps is loaded, you will see black screen for a while.

add custom_icon.dart and custom_icon_assets.dart to this pages in folder reusable => this function used for custom marker

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
- intl => for function frmt (https://pub.dev/packages/intl)
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'dart:ui' as ui;

import 'package:ijtrackerflutter/ui/reuseable/custom_icon.dart';
import 'package:ijtrackerflutter/ui/reuseable/custom_icon_assets.dart';

import 'package:intl/intl.dart' as frmt;

class MapAllDevicesPage extends StatefulWidget {
  @override
  _MapAllDevicesPageState createState() => _MapAllDevicesPageState();
}

class _MapAllDevicesPageState extends State<MapAllDevicesPage> {
  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(-4.207917, 112.1031403);
  double _currentZoom = 15;
  bool _isTraffic = false;

  // for drawing all marker
  Map<MarkerId, Marker> _allMarker = {};

  // for drawing all polylines
  Map<PolylineId, Polyline> _allPolyline = {};

  // for getting all latitude and longitude
  Map<PolylineId, List<LatLng>> _allLatlng = {};

  List<LatLng> _latLngBound = [];

  bool _infoDetail = false;
  String _sn = '';
  var _deviceIcon;
  String _deviceName = '';
  String _posLatLong = '';
  int _battery = 100;
  String _speed = '';
  String _gpsDate = '';
  String _stopTime = '';

  // Colour for every polyline marker
  Map<String, Color> _allColor = {};
  Random _random = Random();

  // create random color for polylines
  Color _getColor() {
    return Color.fromARGB(
        255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
  }

  // sound when marker move
  AudioPlayer _audioPlayer = AudioPlayer();
  Future _startSoundLive() async {
    _stopSound();
    await _audioPlayer.play(AssetSource('sound/live.mp3'));
    _audioPlayer.onPlayerComplete.listen((event) {
      _stopSound();
    });
  }

  Future _stopSound() async {
    await _audioPlayer.stop();
  }

  // this function is to create custom marker with label at the top of icon
  Future<BitmapDescriptor> _myPainterToBitmap(String label, String icon) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    CustomIcon myPainter = CustomIcon(label, icon);

    final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        textDirection: TextDirection.ltr);
    textPainter.layout();

    myPainter.paint(canvas,
        Size(textPainter.size.width + 30, textPainter.size.height + 25));
    final ui.Image image = await recorder.endRecording().toImage(
        textPainter.size.width.toInt() + 30,
        textPainter.size.height.toInt() + 25 + 50);
    final ByteData byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    Uint8List data = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(data);
  }

  // this function is to create custom marker with label at the top of icon with assets image
  Future<BitmapDescriptor> _myPainterImageToBitmap(
      String label, ui.Image imageIcon) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    CustomIconAssets myPainter = CustomIconAssets(label, imageIcon);

    final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        textDirection: TextDirection.ltr);
    textPainter.layout();

    myPainter.paint(canvas,
        Size(textPainter.size.width + 30, textPainter.size.height + 25));
    final ui.Image image = await recorder.endRecording().toImage(
        textPainter.size.width.toInt() + 30,
        textPainter.size.height.toInt() + 25 + 50);
    final ByteData byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    Uint8List data = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(data);
  }

  // test
  late ui.Image _iconElderly;

  Future<Null> _initImage() async {
    final ByteData dataElderly =
    await rootBundle.load('assets/images/1.5x/elderly.png');
    _iconElderly = await _loadImage(Uint8List.view(dataElderly.buffer));
  }

  Future<ui.Image> _loadImage(List<int> img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.fromList(img), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

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

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  // function for formating date and time
  String _formatDatetime(String date) {
    var dateTime = frmt.DateFormat('yyyy-MM-dd HH:mm:ss').parse(date, true);
    var newDate =
    frmt.DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
    return newDate;
  }

  // below is function to change the marker
  String _moveSn = deviceData[0].sn;
  List<String> _choices = <String>['Change SN to :']; // don't forget to add choices data when initState
  void _choiceAction(String choice) {
    for(int i=0;i<=deviceData.length-1;i++){
      if(choice == deviceData[i].sn){
        _moveSn = deviceData[i].sn;
      }
    }

    if(choice != 'Change SN to :'){
      Fluttertoast.showToast(msg: 'Change SN to '+_moveSn, toastLength: Toast.LENGTH_LONG);
    }
  }

  // this function is to move the marker related to SN that has been choose
  void _moveMarker(String sn, double gpsLat, double gpsLng) {
    LatLng position = LatLng(gpsLat, gpsLng);

    for(int i=0;i<=deviceData.length-1;i++){
      if(sn == deviceData[i].sn){
        if (deviceData[i].iconName == 'elderly' || deviceData[i].iconName == 'luggage') {
          ui.Image iconImage = _iconElderly;
          _myPainterImageToBitmap(deviceData[i].devName, iconImage)
              .then((BitmapDescriptor bitmapDescriptor) {
            _allLatlng[PolylineId(deviceData[i].sn)]!.add(position);
            _allPolyline[PolylineId(deviceData[i].sn)] = Polyline(
              polylineId: PolylineId(deviceData[i].sn),
              visible: true,
              width: 2,
              points: _allLatlng[PolylineId(deviceData[i].sn)]!,
              color: _allColor[deviceData[i].sn]!,
            );

            _allMarker[MarkerId(deviceData[i].sn)] = Marker(
                markerId: MarkerId(deviceData[i].sn),
                flat: false,
                position: position,
                anchor: Offset(0.5, 0.8),
                rotation: 0,
                icon: bitmapDescriptor,
                onTap: () {
                  this._sn = deviceData[i].sn;
                  _deviceIcon = ImageIcon(deviceData[i].devIcon, size: 13, color: MAPS_IMAGES_COLOR);
                  _deviceName = deviceData[i].devName;
                  _posLatLong = gpsLat.toString().substring(0, 10) + ', ' + gpsLng.toString().substring(0, 10);
                  _battery = deviceData[i].power;
                  _speed = deviceData[i].speed;
                  _gpsDate = deviceData[i].date;
                  setState(() {
                    _infoDetail = true;
                  });
                });
            setState(() {

            });
          });
        } else {
          _myPainterToBitmap(deviceData[i].devName, deviceData[i].iconName)
              .then((BitmapDescriptor bitmapDescriptor) {
            _allLatlng[PolylineId(deviceData[i].sn)]!.add(position);
            _allPolyline[PolylineId(deviceData[i].sn)] = Polyline(
              polylineId: PolylineId(deviceData[i].sn),
              visible: true,
              width: 2,
              points: _allLatlng[PolylineId(deviceData[i].sn)]!,
              color: _allColor[deviceData[i].sn]!,
            );

            _allMarker[MarkerId(deviceData[i].sn)] = Marker(
                markerId: MarkerId(deviceData[i].sn),
                flat: false,
                position: position,
                anchor: Offset(0.5, 0.8),
                rotation: 0,
                icon: bitmapDescriptor,
                onTap: () {
                  this._sn = deviceData[i].sn;
                  _deviceIcon = Icon(deviceData[i].devIcon, size: 13, color: MAPS_IMAGES_COLOR);
                  _deviceName = deviceData[i].devName;
                  _posLatLong = gpsLat.toString().substring(0, 10) + ', ' + gpsLng.toString().substring(0, 10);
                  _battery = deviceData[i].power;
                  _speed = deviceData[i].speed;
                  _gpsDate = deviceData[i].date;
                  setState(() {
                    _infoDetail = true;
                  });
                });
            setState(() {

            });
          });
        }
      }
    }

    // play sound when the marker move
    _startSoundLive();
  }

  @override
  void initState() {
    // add choices data
    for(int i=0;i<=deviceData.length-1;i++){
      _choices.add(deviceData[i].sn);
    }
    _initImage();
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    _stopSound();
    super.dispose();
  }

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
        myLocationEnabled: false,
        mapToolbarEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4,
        ),
        markers: Set<Marker>.of(_allMarker.values),
        polylines: Set<Polyline>.of(_allPolyline.values),
        onCameraMove: _onGeoChanged,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

          // we use timer for this demo
          // in the real application, get the position from database
          // Get the marker from API and add the marker here
          _timerDummy = Timer(Duration(milliseconds: 500), () {
            setState(() {
              _mapLoading = false;
            });

            // THIS FOR IS TO DRAW THE MARKER TO THE GOOGLE MAPS
            // if we don't use "for" or "loop" to draw the marker, the custom marker icon will not work
            for(int i=0;i<=deviceData.length-1;i++){
              if (deviceData[i].iconName == 'elderly' || deviceData[i].iconName == 'luggage') {
                _latLngBound.add(deviceData[i].gpsPosition);

                ui.Image iconImage = _iconElderly;
                _myPainterImageToBitmap(deviceData[i].devName, iconImage)
                    .then((BitmapDescriptor bitmapDescriptor) {
                  _allMarker[MarkerId(deviceData[i].sn)] = Marker(
                      markerId: MarkerId(deviceData[i].sn),
                      flat: false,
                      position: deviceData[i].gpsPosition,
                      anchor: Offset(0.5, 0.8),
                      rotation: 0,
                      icon: bitmapDescriptor,
                      onTap: () {
                        _sn = deviceData[i].sn;
                        _deviceIcon = ImageIcon(deviceData[i].devIcon,
                            color: MAPS_IMAGES_COLOR, size: 13);
                        _deviceName = deviceData[i].devName;
                        _posLatLong =
                            deviceData[i].gpsLat.toString() + ', ' + deviceData[i].gpsLong.toString();
                        _battery = deviceData[i].power;
                        _speed = deviceData[i].speed;
                        _gpsDate = deviceData[i].date;

                        setState(() {
                          _infoDetail = true;
                        });
                      });
                  setState(() {});
                });

                Color polyColor = _getColor();
                _allColor[deviceData[i].sn] = polyColor;
                _allLatlng[PolylineId(deviceData[i].sn)] = [];
                _allLatlng[PolylineId(deviceData[i].sn)]!.add(deviceData[i].gpsPosition);
                _allPolyline[PolylineId(deviceData[i].sn)] = Polyline(
                  polylineId: PolylineId(deviceData[i].sn),
                  visible: true,
                  width: 2,
                  points: _allLatlng[PolylineId(deviceData[i].sn)]!,
                  color: polyColor,
                );
              } else {
                _latLngBound.add(deviceData[i].gpsPosition);
                _myPainterToBitmap(deviceData[i].devName, deviceData[i].iconName)
                    .then((BitmapDescriptor bitmapDescriptor) {
                  _allMarker[MarkerId(deviceData[i].sn)] = Marker(
                      markerId: MarkerId(deviceData[i].sn),
                      flat: false,
                      position: deviceData[i].gpsPosition,
                      anchor: Offset(0.5, 0.8),
                      rotation: 0,
                      icon: bitmapDescriptor,
                      onTap: () {
                        _sn = deviceData[i].sn;
                        _deviceIcon =
                            Icon(deviceData[i].devIcon, size: 13, color: MAPS_IMAGES_COLOR);
                        _deviceName = deviceData[i].devName;
                        _posLatLong =
                            deviceData[i].gpsLat.toString() + ', ' + deviceData[i].gpsLong.toString();
                        _battery = deviceData[i].power;
                        _speed = deviceData[i].speed;
                        _gpsDate = deviceData[i].date;

                        setState(() {
                          _infoDetail = true;
                        });
                      });
                  setState(() {});
                });

                Color polyColor = _getColor();
                _allColor[deviceData[i].sn] = polyColor;
                _allLatlng[PolylineId(deviceData[i].sn)] = [];
                _allLatlng[PolylineId(deviceData[i].sn)]!.add(deviceData[i].gpsPosition);
                _allPolyline[PolylineId(deviceData[i].sn)] = Polyline(
                  polylineId: PolylineId(deviceData[i].sn),
                  visible: true,
                  width: 2,
                  points: _allLatlng[PolylineId(deviceData[i].sn)]!,
                  color: polyColor,
                );
              }
            }

            CameraUpdate u2;
            if (_latLngBound.length == 1) {
              u2 = CameraUpdate.newCameraPosition(CameraPosition(target: _latLngBound[0], zoom: 15));
            } else {
              u2 = CameraUpdate.newLatLngBounds(
                  _boundsFromLatLngList(_latLngBound), 50);
            }
            this._controller.moveCamera(u2).then((void v) {
              _check(u2, this._controller);
            });
          });
        },
        onTap: (position) {
          setState(() {
            _moveMarker(_moveSn, position.latitude, position.longitude);
            _infoDetail = false;
          });
          print('currentZoom : '+_currentZoom.toString());
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
            'MAP ALL DEVICES',
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
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(),
            Positioned(
              bottom: 40,
              left: 12,
              child: GestureDetector(
                onTap: () {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.router,
                                  size: 13,
                                  color: MAPS_IMAGES_COLOR,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'SN ' + _sn,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            Wrap(
                              children: <Widget>[
                                (_deviceIcon) == null
                                    ? Wrap()
                                    : _deviceIcon,
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _deviceName,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.my_location,
                                  size: 13,
                                  color: MAPS_IMAGES_COLOR,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _posLatLong,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.battery_charging_full,
                                  size: 13,
                                  color: MAPS_IMAGES_COLOR,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _battery.toString() + ' %',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
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
                                  (_gpsDate == '')
                                      ? ''
                                      : _formatDatetime(_gpsDate),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            Visibility(
                              visible: (_stopTime == '') ? false : true,
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
        ));
  }
}
