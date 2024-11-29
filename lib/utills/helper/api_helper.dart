import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'dart:core';

class Apihelper {
  Apihelper._();

  static Apihelper apihelper = Apihelper._();

  Future<Weather?> getWeatherData({required String search}) async {
    String apiKey = "d04e1a60649049fb94350140242911";
    Uri url = Uri.parse(
      "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$search",
    );

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> allWeatherData = jsonDecode(res.body);
      Weather weather = Weather.formMap(data: allWeatherData);
      return weather;
    }
    return null;
  }
}
