/*
  start dummy loading and success
  This function is just for demo
  dummy loading and then show success popup
   */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ijtrackerflutter/config/constants.dart';

void startLoading(context, String textMessage, bool backToPreviousPage){
  _progressDialog(context);
  Timer(Duration(seconds: 2), () {
    Navigator.of(context, rootNavigator: true).pop();
    _buildShowDialog(context, textMessage, backToPreviousPage);
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

Future _buildShowDialog(BuildContext context, String textMessage, bool backToPreviousPage) {
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
                    textMessage,
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
                          Navigator.pop(context);

                          if(backToPreviousPage){
                            FocusScope.of(context).unfocus(); // hide keyboard when press button
                            Navigator.pop(context);
                          }
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