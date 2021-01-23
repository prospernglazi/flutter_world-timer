import 'package:flutter/material.dart';
import 'package:world_timer/constants.dart';

import 'choose_location.dart';

class Home extends StatefulWidget {
  static final String homeId = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldTimeData = {};
  @override
  Widget build(BuildContext context) {
    worldTimeData = worldTimeData.isNotEmpty
        ? worldTimeData
        : ModalRoute.of(context).settings.arguments;

    String bgImage = worldTimeData['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor =
        worldTimeData['isDayTime'] ? Colors.blue : Colors.indigo[700];

    print(worldTimeData);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, ChooseLocation.locationId);
                    setState(() {
                      worldTimeData = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      worldTimeData['location'],
                      style: kLocationStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  worldTimeData['time'],
                  style: kTimeStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
