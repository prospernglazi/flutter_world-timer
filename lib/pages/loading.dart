import 'package:flutter/material.dart';
import 'package:world_timer/pages/home.dart';
import 'package:world_timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  static final String loadingId = 'loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime();
    await worldTime.getTimeByIP();
    Navigator.pushReplacementNamed(context, Home.homeId, arguments: {
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime ?? false
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Location List'),
      ),
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
