import 'dart:convert';

import 'package:http/http.dart';

class Networking {
  static Future<dynamic> getData(String url) async {
    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to get data. Code ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
