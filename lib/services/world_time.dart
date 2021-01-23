import 'package:intl/intl.dart';
import 'package:world_timer/services/networking.dart';
import 'package:world_timer/utils/getCountryName.dart';

const String baseUrl = 'http://worldtimeapi.org/api';

class WorldTime {
  String timezone;
  String location;
  String time;
  bool isDayTime;

  WorldTime({this.location, this.timezone});

  static Future<dynamic> getTimezoneList() async {
    final String url = '$baseUrl/timezone';
    var data = await Networking.getData(url);
    return data;
  }

  Future<void> getTime(urlString) async {
    try {
      Map data = await Networking.getData(urlString);
      RegExp rgx = RegExp(r"/(\w+)");
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      location = getCountryFromTimezone(timezone: data['timezone']);

      DateTime now = DateTime.parse(dateTime).add(
        Duration(hours: int.parse(offset)),
      );

      isDayTime = now.hour >= 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Exception caught: $e');
      time = 'Could not get time data';
    }
  }

  Future<void> getTimeByIP() async {
    final String urlString = '$baseUrl/ip';
    await getTime(urlString);
  }

  Future<void> getTimeByCountry() async {
    final String urlString = '$baseUrl/timezone/$timezone';
    await getTime(urlString);
  }
}
