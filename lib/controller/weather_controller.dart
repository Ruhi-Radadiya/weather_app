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
    log("City = $search");
    return await Apihelper.apihelper.getWeatherData(search: search);
  }
}
