import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/utills/helper/api_helper.dart';

import '../models/weather_model.dart';

class WeatherController extends ChangeNotifier {
  String search = "Surat";

  void getData(String search) {
    this.search = search;
    notifyListeners();
  }

  Future<Weather?> fetchWeatherData() async {
    return await Apihelper.apihelper.getWeatherData(search: search);
  }
}
//snow
//https://static.vecteezy.com/system/resources/thumbnails/024/825/197/small/3d-weather-icon-day-with-snow-free-png.png
//thunder
//https://static.vecteezy.com/system/resources/previews/024/825/193/non_2x/3d-weather-icon-day-with-rain-free-png.png
//rain
//https://static.vecteezy.com/system/resources/thumbnails/008/854/797/small_2x/sunny-and-rainy-cloudy-day-weather-forecast-icon-meteorological-sign-3d-render-png.png
//windy
//https://static.vecteezy.com/system/resources/thumbnails/012/066/506/small/sunny-and-windy-day-weather-forecast-icon-meteorological-sign-3d-render-png.png
//thunder
//https://static.vecteezy.com/system/resources/previews/008/854/785/non_2x/lightning-strike-thunderstorm-weather-icon-meteorological-sign-3d-render-png.png
//sunny
//https://static.vecteezy.com/system/resources/previews/024/825/180/non_2x/3d-weather-icon-day-free-png.png
