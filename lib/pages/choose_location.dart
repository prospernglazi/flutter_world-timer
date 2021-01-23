import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  static final String locationId = 'location';
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List locations = [];
  bool isLoading;

  Future<void> populateLocationList() async {
    isLoading = true;
    locations = await WorldTime.getTimezoneList();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> updateTime(index) async {
    WorldTime worldTime =
        WorldTime(location: locations[index], timezone: locations[index]);
    await worldTime.getTimeByCountry();
    Navigator.pop(
      context,
      {
        'location': worldTime.location,
        'time': worldTime.time,
        'isDayTime': worldTime.isDayTime ?? false
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateLocationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: isLoading
          ? Text('Loading')
          : ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      await updateTime(index);
                    },
                    title: Text(locations[index]),
                  ),
                ),
              ),
            ),
    );
  }
}
