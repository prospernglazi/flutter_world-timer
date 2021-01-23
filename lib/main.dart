import 'package:flutter/material.dart';
import 'package:world_timer/pages/choose_location.dart';
import 'package:world_timer/pages/home.dart';
import 'package:world_timer/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: Loading.loadingId,
    routes: {
      Loading.loadingId: (context) => Loading(),
      Home.homeId: (context) => Home(),
      ChooseLocation.locationId: (context) => ChooseLocation()
    },
  ));
}
