/*
This is history page
Just for choose date and GPS Type and then direct to history_map.dart
add radio_value.dart to this pages in folder config, this is used to define the value of radio button

install plugin in pubspec.yaml
- date_format => used for date formating (https://pub.dev/packages/date_format)
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart'
    show MENU_IMAGES_COLOR, PRIMARY_COLOR;
import 'package:ijtrackerflutter/config/radio_value.dart';
import 'package:date_format/date_format.dart';
import 'package:ijtrackerflutter/ui/history_map.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryValue _history = HistoryValue.today;
  List<String> _gpsType = [];
  String _setFirst = 'GPS Only';
  String _valDate = '';

  DateTime _selectedDate = DateTime.now(), initialDate = DateTime.now();
  TextEditingController _etDate = TextEditingController();

  @override
  void initState() {
    _gpsType.add('GPS Only');
    _gpsType.add('LBS Only');
    _gpsType.add('Stop Only');
    _gpsType.add('GPS & LBS');

    _etDate = TextEditingController(
        text: _selectedDate.toLocal().toString().split(' ')[0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'HISTORY GPS',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'History',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal),
                ),
                RadioListTile<HistoryValue>(
                  activeColor: MENU_IMAGES_COLOR,
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Today',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  value: HistoryValue.today,
                  groupValue: _history,
                  dense: true,
                  onChanged: (HistoryValue? value) {
                    setState(() {
                      _history = value!;
                    });
                  },
                ),
                RadioListTile<HistoryValue>(
                  activeColor: MENU_IMAGES_COLOR,
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Yesterday',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  value: HistoryValue.yesterday,
                  groupValue: _history,
                  dense: true,
                  onChanged: (HistoryValue? value) {
                    setState(() {
                      _history = value!;
                    });
                  },
                ),
                RadioListTile<HistoryValue>(
                  activeColor: MENU_IMAGES_COLOR,
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Other',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  value: HistoryValue.other,
                  groupValue: _history,
                  dense: true,
                  onChanged: (HistoryValue? value) {
                    setState(() {
                      _history = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                (_history == HistoryValue.other)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Select Date',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.normal),
                          ),
                          TextField(
                            controller: _etDate,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                            maxLines: 1,
                            cursorColor: Colors.grey[600],
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                            decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: IconButton(
                                onPressed: (){

                                },
                                  icon: Icon(Icons.date_range,
                                      color: MENU_IMAGES_COLOR)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[600]!),
                              ),
                              labelText: '',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[600]!),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Container(),
                Text(
                  'Select Type',
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
                  items: _gpsType.map<DropdownMenuItem<String>>((String value) {
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
                        _valDate = formatDate(
                            DateTime(initialDate.year, initialDate.month,
                                initialDate.day),
                            [yyyy, '-', mm, '-', dd]);

                        if (_history == HistoryValue.today) {
                          _valDate = formatDate(
                              DateTime(initialDate.year, initialDate.month,
                                  initialDate.day),
                              [yyyy, '-', mm, '-', dd]);
                        } else if (_history == HistoryValue.yesterday) {
                          _valDate = formatDate(
                              DateTime(initialDate.year, initialDate.month,
                                  initialDate.day - 1),
                              [yyyy, '-', mm, '-', dd]);
                        } else if (_history == HistoryValue.other) {
                          _valDate = _etDate.text;
                        }

                        Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryMapPage(date: _valDate)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'SEARCH',
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
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    var firstDate =
        DateTime(initialDate.year, initialDate.month - 3, initialDate.day);
    var lastDate =
        DateTime(initialDate.year, initialDate.month, initialDate.day + 1);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: MENU_IMAGES_COLOR,
            colorScheme: ColorScheme.light(primary: MENU_IMAGES_COLOR, secondary: MENU_IMAGES_COLOR),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _etDate = TextEditingController(
            text: _selectedDate.toLocal().toString().split(' ')[0]);
      });
    }
  }
}
