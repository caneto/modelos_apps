/*
This is sound setting page

install plugin in pubspec.yaml
- audioplayers => to play audio from assets (https://pub.dev/packages/audioplayers)
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijtrackerflutter/config/constants.dart' show CHARCOAL, PRIMARY_COLOR;

class SoundSettingPage extends StatefulWidget {
  @override
  _SoundSettingPageState createState() => _SoundSettingPageState();
}

class _SoundSettingPageState extends State<SoundSettingPage> {
  bool _valSoundLive = true;
  bool _valSoundSos = false;
  bool _valSoundGeo = true;
  int _soundStatus = 0;

  AudioPlayer _audioPlayer = AudioPlayer();

  Future _startSoundLive() async {
    await _audioPlayer.play(AssetSource('sound/live.mp3'));
    setState(() {
      _soundStatus = 1;
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _soundStatus = 0;
      });
    });
  }

  Future _startSoundSos() async {
    await _audioPlayer.play(AssetSource('sound/sos.mp3'));
    setState(() {
      _soundStatus = 2;
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _soundStatus = 0;
      });
    });
  }

  Future _startSoundGeo() async {
    await _audioPlayer.play(AssetSource('sound/geofence.mp3'));
    setState(() {
      _soundStatus = 3;
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _soundStatus = 0;
      });
    });
  }

  Future _stopSound(bool dispose) async {
    await _audioPlayer.stop();
    if(dispose==false){
      setState(() {
        _soundStatus = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _stopSound(true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'SOUND SETTING',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  (_soundStatus==1)?
                  GestureDetector(
                      onTap: () {
                        _stopSound(false);
                      },
                      child: Icon(Icons.pause_circle_filled,
                          size: 40, color: PRIMARY_COLOR)):
                  GestureDetector(
                      onTap: () {
                        _startSoundLive();
                      },
                      child: Icon(Icons.play_circle_filled, size: 40, color: PRIMARY_COLOR)),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: _buildSwitchLive(),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  (_soundStatus==2)?
                  GestureDetector(
                      onTap: () {
                        _stopSound(false);
                      },
                      child: Icon(Icons.pause_circle_filled,
                          size: 40, color: PRIMARY_COLOR)):
                  GestureDetector(
                      onTap: () {
                        _startSoundSos();
                      },
                      child: Icon(Icons.play_circle_filled, size: 40, color: PRIMARY_COLOR)),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: _buildSwitchSos(),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  (_soundStatus==3)?
                  GestureDetector(
                      onTap: () {
                        _stopSound(false);
                      },
                      child: Icon(Icons.pause_circle_filled,
                          size: 40, color: PRIMARY_COLOR)):
                  GestureDetector(
                      onTap: () {
                        _startSoundGeo();
                      },
                      child: Icon(Icons.play_circle_filled, size: 40, color: PRIMARY_COLOR)),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: _buildSwitchGeo(),
                  )
                ],
              ),
              SizedBox(height: 15),
              _buildSaveButton()
            ],
          ),
        )
    );
  }

  SwitchListTile _buildSwitchLive() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Sound when device move at Live Location Menu and Map All Devices Menu',
        style: TextStyle(fontSize: 14, color: CHARCOAL),
      ),
      value: _valSoundLive,
      onChanged: (bool value) {
        setState(() {
          _valSoundLive = value;
        });
      },
    );
  }

  SwitchListTile _buildSwitchSos() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'SOS Alarm Sound',
        style: TextStyle(fontSize: 14, color: CHARCOAL),
      ),
      value: _valSoundSos,
      onChanged: (bool value) {
        setState(() {
          _valSoundSos = value;
        });
      },
    );
  }

  SwitchListTile _buildSwitchGeo() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Geofence Sound',
        style: TextStyle(fontSize: 14, color: CHARCOAL),
      ),
      value: _valSoundGeo,
      onChanged: (bool value) {
        setState(() {
          _valSoundGeo = value;
        });
      },
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.maxFinite,
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
            Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_LONG);
            Navigator.of(context, rootNavigator: true).pop();
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
    );
  }
}
