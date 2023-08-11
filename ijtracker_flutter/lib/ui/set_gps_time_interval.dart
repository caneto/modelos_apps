/*
This is set interval gps page
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';

class SetIntervalGpsPage extends StatefulWidget {
  @override
  _SetIntervalGpsPageState createState() => _SetIntervalGpsPageState();
}

class _SetIntervalGpsPageState extends State<SetIntervalGpsPage> {
  List<String> _intervalList = [];
  String _setFirst = '20 second';

  @override
  void initState() {
    _intervalList.add('20 second');
    _intervalList.add('60 second');
    _intervalList.add('3 minute');
    _intervalList.add('5 minute');
    _intervalList.add('10 minute (Default)');
    _intervalList.add('30 minute');
    _intervalList.add('1 hour');
    _intervalList.add('2 hour');
    _intervalList.add('1 day');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'SET GPS TIME INTERVAL',
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
                '1234567890',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 20,
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
              Text(
                deviceData[0].devName,
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
              DropdownButton<String>(
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
                  });
                },
                items: _intervalList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(child: Text(value)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
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
                      startLoading(context, 'Set Interval GPS Success', true);
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
