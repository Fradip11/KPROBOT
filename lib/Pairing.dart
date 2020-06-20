import 'package:flutter/material.dart';
import 'package:splashscreen02/mainMenu.dart';
import 'package:splashscreen02/styles.dart';

class Pairing extends StatefulWidget {
  @override
  _PairingState createState() => _PairingState();
}

bool isBluetoothOn = false;
int roboNumber = 1;
int roboAvailNumber = 2;
double opacityRobot1 = 0;
String robotName = "Robot ";

class _PairingState extends State<Pairing> {
  @override
  Widget build(BuildContext context) {
    double t_width = MediaQuery.of(context).size.width;
    double t_heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD).withOpacity(0.9),
                Color(0xFF4563DB).withOpacity(0.9),
                Color(0xFF5036D5).withOpacity(0.9),
                Color(0xFF5B16D0).withOpacity(0.9),
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 20),
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            'Pairing',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text('Lakukan',
                            style: insideStyle),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Pairing dengan',
                            style: insideStyle),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Robot yang Available',
                            style: insideStyle),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enable Bluetooth', style: insideStyle),
                            Switch(
                              value: isBluetoothOn,
                              onChanged: (value) {
                                setState(() {
                                  isBluetoothOn = value;
                                  print(isBluetoothOn);
                                });
                              },
                              activeTrackColor: Colors.white70,
                              activeColor: Colors.blueAccent[300],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Connected Devices',
                              style: insideStyle,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
                              onPressed: () {
                                _showMyDialog(context);
                              }),
                        ],
                      ),
                      Container(
                        width: t_width,
                        height: t_heigth * 0.15,
                        child: Text(
                            'Container ini ntar masukin codingan Paired device',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Available Devices',
                              style: insideStyle,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
                              onPressed: () {
                                _showMyDialog(context);
                              })
                        ],
                      ),
                      Container(
                        width: t_width,
                        height: t_heigth * 0.15,
                        child: Text(
                          'Container ini ntar masukin codingan Discovery device',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainMenu()));
          },
          label: Text(
            'Mulai',
            style: TextStyle(color: Colors.blue),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.blue),
          backgroundColor: Colors.white,
        ));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Robot Setting'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama Robot'),
                      FlatButton(
                          onPressed: () {
                            editRoboName(context);
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Tutup'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> editRoboName(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Robot Setting'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  print("First text field: $text");
                  robotName = text;
                },
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Tutup'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
