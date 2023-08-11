/*
This is history map page
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

- intl => for function DateFormat (https://pub.dev/packages/intl)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:ijtrackerflutter/model/gps_model.dart';
import 'package:intl/intl.dart';

class HistoryMapPage extends StatefulWidget {
  final String date;

  // create constructor to get variable already sent from history_gps.dart page
  const HistoryMapPage({Key? key, this.date = ''}) : super(key: key);

  @override
  _HistoryMapPageState createState() => _HistoryMapPageState();
}

class _HistoryMapPageState extends State<HistoryMapPage> {
  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(-4.207917, 112.1031403);

  // variable to mapping all markers and polylines
  Map<MarkerId, Marker> _allMarker = {};
  List<LatLng> _latlng = [];
  bool _isBound = false;
  bool _doneListing = false;
  Map<PolylineId, Polyline> _mapPolylines = {};

  // gps detail data information
  bool _infoDetail = true;
  String _speed = '';
  String _gpsDate = '';
  String _stopTime = '';
  String _mileage = '';

  // variable for progress bar
  double _valProgress = 0, _valSpeed = 1;
  bool _playHistory = false;

  // this function is used to play the history of marker
  Timer? _timer;
  void _startTimer() {
    if(_valProgress==historyGpsData.length-1){
      if (_showMarker == false) {
        _allMarker[MarkerId(_valProgress
            .round()
            .toString())] = _allMarker[
        MarkerId(_valProgress
            .round()
            .toString())]!
            .copyWith(
          visibleParam: false,
        );
      }

      _changeSliderProgress(0);
    }
    _timer = Timer.periodic(
      Duration(milliseconds: 1000~/_valSpeed), (Timer timer) {
      if (_valProgress.toInt() >= historyGpsData.length-1) {
        timer.cancel();
        setState(() {
          _playHistory = (_playHistory) ? false : true;
        });
      } else {
        if (_showMarker == false) {
          _allMarker[MarkerId(_valProgress
              .round()
              .toString())] = _allMarker[
          MarkerId(_valProgress
              .round()
              .toString())]!
              .copyWith(
            visibleParam: false,
          );
        }

        double newVal = _valProgress+1;
        _changeSliderProgress(newVal);
      }
    },
    );
  }

  void _changeSliderProgress(double val){
    setState(() {
      _valProgress = val;

      _speed = historyGpsData[_valProgress.round()].speed;
      _mileage = historyGpsData[_valProgress.round()].mileage;
      _gpsDate = historyGpsData[_valProgress.round()].gpsDate;
      _stopTime = historyGpsData[_valProgress.round()].stopTime;

      _infoDetail = true;

      if (_showMarker == false) {
        _allMarker[MarkerId(_valProgress.round().toString())] =
            _allMarker[MarkerId(_valProgress.round().toString())]!
                .copyWith(
              visibleParam: true,
            );
      } else {
        _allMarker[MarkerId(_valProgress.round().toString())] =
            _allMarker[MarkerId(_valProgress.round().toString())]!
                .copyWith(
              zIndexParam:
              9999, //infoWindowParam: InfoWindow(title: 'here')
            );
      }
      _controller.getZoomLevel().then((zoom) {
        _currentZoom = zoom;
        _controller.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(historyGpsData[_valProgress.round()].lat, historyGpsData[_valProgress.round()].long),
                zoom: zoom)));
      });
    });
  }

  double _currentZoom = 15;

  bool _showMarker = false;

  // this function is to draw custom marker
  late BitmapDescriptor _markerDirection;
  late BitmapDescriptor _markerStop;
  void _setSourceAndDestinationIcons() async {
    _markerDirection = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/direction.png');
    _markerStop = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/stop.png');
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

  // when the Google Maps Camera is change, get the current position
  void _onGeoChanged(CameraPosition position) {
    _currentZoom = position.zoom;
  }

  String _formatDatetime(String date) {
    var dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date, true);
    var newDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
    return newDate;
  }

  @override
  void initState() {
    _setSourceAndDestinationIcons();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
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
        mapToolbarEnabled: true,
        markers: Set<Marker>.of(_allMarker.values),
        polylines: Set<Polyline>.of(_mapPolylines.values),
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4,
        ),
        onCameraMove: _onGeoChanged,
        onCameraIdle: (){
          if(_isBound==false && _doneListing==true) {
            _isBound = true;
            CameraUpdate u2=CameraUpdate.newLatLngBounds(_boundsFromLatLngList(_latlng), 50);
            this._controller.moveCamera(u2).then((void v){
              _check(u2,this._controller);
            });
          }
        },
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

          // we use timer for this demo
          // in the real application, get all marker from database
          // Get the marker from API and add the marker here
          _timerDummy = Timer(Duration(seconds: 1), () {
            setState(() {
              _mapLoading = false;

              // add all marker here
              for (int i = 0; i < historyGpsData.length; i++) {
                LatLng position = LatLng(historyGpsData[i].lat,
                    historyGpsData[i].long);
                _latlng.add(position);

                BitmapDescriptor markerIcon;
                Offset markerAnchor = Offset(0.5, 0.5);
                if (historyGpsData[i].stopTime == '') {
                  markerIcon = _markerDirection;
                } else {
                  markerIcon = _markerStop;
                }

                double angle = 0;
                if (historyGpsData[i].stopTime == '') {
                  angle = historyGpsData[i].direction.toDouble();
                }

                if (i == 0) {
                  _speed = historyGpsData[i].speed;
                  _mileage = historyGpsData[i].mileage;
                  _gpsDate = historyGpsData[i].gpsDate;
                  _stopTime = historyGpsData[i].stopTime;
                }

                _allMarker[MarkerId(i.toString())] = Marker(
                  markerId: MarkerId(i.toString()),
                  visible: (i == 0) ? true : false,
                  flat: (historyGpsData[i].stopTime == '')
                      ? true
                      : false,
                  position: position,
                  anchor: markerAnchor,
                  onTap: () {
                    _speed = historyGpsData[i].speed;
                    _mileage = historyGpsData[i].mileage;
                    _gpsDate = historyGpsData[i].gpsDate;
                    _stopTime = historyGpsData[i].stopTime;

                    setState(() {
                      _infoDetail = true;
                    });
                  },
                  rotation: angle,
                  icon: markerIcon,
                );
                if(i==historyGpsData.length-1){
                  _doneListing = true;
                }
              }

              // draw all polylines here
              final PolylineId polylineId = PolylineId('track');
              final Polyline polyline = Polyline(
                polylineId: polylineId,
                visible: true,
                width: 2,
                points: _latlng,
                color: MAPS_IMAGES_COLOR,
              );
              _mapPolylines[polylineId] = polyline;

              // zoom to all track polylines
              if(_isBound==false && _doneListing==true) {
                _isBound = true;
                CameraUpdate u2=CameraUpdate.newLatLngBounds(_boundsFromLatLngList(_latlng), 50);
                this._controller.moveCamera(u2).then((void v){
                  _check(u2,this._controller);
                });
              }
            });
          });
        },
        onTap: (position) {
          setState(() {
            _infoDetail = false;
          });
          print('currentZoom : '+_currentZoom.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'HISTORY ( ' + widget.date.toString() + ' )',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  _buildGoogleMap(),
                  Positioned.fill(
                    top: 12,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        color: Color(0x950a4349),
                        child: Wrap(
                          children: <Widget>[
                            Icon(
                              deviceData[0].devIcon,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              deviceData[0].devName + ' | ' + deviceData[0].sn,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showMarker = (_showMarker) ? false : true;

                          for (int a = 0; a < _allMarker.length; a++) {
                            if (a != _valProgress) {
                              _allMarker[MarkerId(a.toString())] =
                                  _allMarker[MarkerId(a.toString())]!.copyWith(
                                    visibleParam: _showMarker,
                                  );
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 36,
                        height: 36,
                        color: Color(0x99FFFFFF),
                        child: Icon(
                          (_showMarker)
                              ? Icons.location_on
                              : Icons.location_off,
                          color: MAPS_IMAGES_COLOR,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 14,
                    child: AnimatedOpacity(
                      opacity: _infoDetail ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 400),
                      child: Align(
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
                                        Icons.timeline,
                                        size: 13,
                                        color: MAPS_IMAGES_COLOR,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'mileage : '+_mileage,
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
                                ],
                              ),
                            ),
                          )
                        ]),
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
            ),
            Container(
                margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          if(_playHistory){
                            if(_timer!=null){
                              _timer!.cancel();
                            }
                          } else {
                            _startTimer();
                          }
                          setState(() {
                            _playHistory = (_playHistory) ? false : true;
                          });
                        },
                        child: Icon(
                          (_playHistory)
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          color: MAPS_IMAGES_COLOR,
                          size: 40,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Progress',
                          style: TextStyle(fontSize: 14, color: MAPS_IMAGES_COLOR),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Speed',
                          style: TextStyle(fontSize: 14, color: MAPS_IMAGES_COLOR),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 20,
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
                                value: _valProgress,
                                min: 0,
                                max: historyGpsData.length.toDouble() - 1,
                                divisions: (historyGpsData.length - 1)==0?1:historyGpsData.length - 1,
                                onChanged: (newValue) {
                                  if (_showMarker == false) {
                                    _allMarker[MarkerId(_valProgress
                                        .round()
                                        .toString())] = _allMarker[
                                    MarkerId(_valProgress
                                        .round()
                                        .toString())]!
                                        .copyWith(
                                      visibleParam: false,
                                    );
                                  }
                                  _changeSliderProgress(newValue);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 20,
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
                                value: _valSpeed,
                                min: 1,
                                max: 12,
                                divisions: 11,
                                onChanged: (newValue) {
                                  setState(() {
                                    _valSpeed = newValue.round().toDouble();
                                    if(_timer!=null){
                                      _timer!.cancel();
                                    }
                                    if(_playHistory) {
                                      _startTimer();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        )
    );
  }
}
