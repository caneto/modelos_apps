/*
This is edit center number page
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/model/device_model.dart';
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';

class EditCenterNumberPage extends StatefulWidget {
  @override
  _EditCenterNumberPageState createState() => _EditCenterNumberPageState();
}

class _EditCenterNumberPageState extends State<EditCenterNumberPage> {
  TextEditingController _etCenterNumber = TextEditingController();

  @override
  void initState() {
    _etCenterNumber = TextEditingController(text: '+62811888999');
    super.initState();
  }

  @override
  void dispose() {
    _etCenterNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CENTER NUMBER',
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
              TextField(
                controller: _etCenterNumber,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Center Number',
                    labelStyle:
                    TextStyle(color: Colors.grey[700], fontSize: 13)),
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
                      startLoading(context, 'Edit Center Number Success', true);
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
