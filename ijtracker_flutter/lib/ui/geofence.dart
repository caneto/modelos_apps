/*
This is geofence page
add shimmer loading to makes the loading more beautiful
add shimmer_loading.dart to this pages in folder reuseable

At GestureDetector Widget add attribute below
behavior: HitTestBehavior.translucent
With this, you can hit all space on GestureDetector
If you don't use above attribute, you still can direct to another pages when you click right on the images or text

install plugin in pubspec.yaml
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)
- shimmer_loading => to add beautiful loading (https://pub.dev/packages/shimmer)
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/geofence_model.dart';
import 'package:ijtrackerflutter/ui/add_geofence.dart';
import 'package:ijtrackerflutter/ui/edit_geofence.dart';
import 'package:ijtrackerflutter/ui/reuseable/shimmer_loading.dart';

class GeofencePage extends StatefulWidget {
  @override
  _GeofencePageState createState() => _GeofencePageState();
}

class _GeofencePageState extends State<GeofencePage> {
  bool _loading = true;
  Timer? _timerDummy;

  @override
  void initState() {
    // this timer function is just for demo, so after 2 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GEOFENCE',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                'Geofence List : ',
                style: TextStyle(color: Colors.grey[600]),
              )),
          Expanded(
            child: (_loading == true)
                ? Center(child: ShimmerList())
                : ListView(
                padding: EdgeInsets.only(bottom: 12),
                children: List.generate(geofenceData.length, (index) {
                  return _buildGeofence(index);
                })
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddGeofencePage()));
        },
        child: Icon(Icons.add),
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }

  Widget _buildGeofence(index){
    return GestureDetector(
      onTap: () {
        _showDialog(context, index);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              geofenceData[index].geoName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: CHARCOAL),
            ),
            Container(
                margin: EdgeInsets.only(top: 3),
                child: Text(
                  geofenceData[index].geoDesc,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey),
                )),
            Container(
                child: Text(
                  'Position : '+geofenceData[index].geoLat.toString()+', '+geofenceData[index].geoLong.toString(),
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey),
                )),
            Container(
                child: Text(
                  'Radius : '+geofenceData[index].geoRad.toString()+' m',
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey),
                )),
            Container(
                child: Text(
                  'Active : '+geofenceData[index].geoActive.toString(),
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey),
                )),
            SizedBox(
              height: 10,
            ),
            Container(color: Colors.grey[300], height: 1),
          ],
        ),
      ),
    );
  }

  // Show Dialog function
  void _showDialog(context, index) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: Text('Select Action'),
          content: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditGeofencePage(geoId: geofenceData[index].id)));
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Text('Edit')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      _showAlertDialog(context, index);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Text('Delete')),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        geofenceData[index].setActive(geofenceData[index].geoActive);
                      });
                      Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_LONG);
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Text('Non Active')),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context, index) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text('Are you sure to delete ?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx, rootNavigator: true).pop();
                },
                child: Text('No')
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    geofenceData.removeAt(index);
                  });
                  Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_LONG);
                  Navigator.of(ctx, rootNavigator: true).pop();
                },
                child: Text('Yes')
            ),
          ],
        );
      },
    );
  }
}
