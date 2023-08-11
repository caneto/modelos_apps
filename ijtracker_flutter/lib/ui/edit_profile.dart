/*
This is edit profile page
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart'
    show PRIMARY_COLOR;
import 'package:ijtrackerflutter/ui/reuseable/dummy_loading.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _etName = TextEditingController();
  TextEditingController _etPhone = TextEditingController();

  @override
  void initState() {
    _etName = TextEditingController(text: 'Robert Steven');
    _etPhone = TextEditingController(text: '+62811888999');

    super.initState();
  }

  @override
  void dispose() {
    _etName.dispose();
    _etPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'EDIT PROFILE',
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
                controller: _etName,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _etPhone,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600]!)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Phone Number',
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
                      startLoading(context, 'Edit Profile Success', true);
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
