import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/weather_controller.dart';
import '../models/weather_model.dart';

TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.black26,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Consumer<WeatherController>(builder: (context, provider, _) {
            return FutureBuilder(
              future: provider.fetchWeatherData(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text("Error : ${snapShot.error}"),
                  );
                } else if (snapShot.hasData) {
                  Weather? weather = snapShot.data;
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              controller: searchController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Search City Name",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                border: const OutlineInputBorder(),
                                prefixIcon: IconButton(
                                  color: Colors.black.withOpacity(0.5),
                                  onPressed: () {
                                    provider.getData(searchController.text);
                                  },
                                  icon: Icon(CupertinoIcons.search),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${weather!.location.name}",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${weather!.location.country}",
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),
                                child: Image.network(
                                  "https://static.vecteezy.com/system/resources/previews/024/825/180/non_2x/3d-weather-icon-day-free-png.png",
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "${weather!.current.tempC}°C",
                                style: const TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "${weather!.forecast.forecastday[0].day.mintemp_c}°C / ${weather!.forecast.forecastday[0].day.maxtemp_c}°C",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Center(
                              child: Text(
                                "${weather!.current.condition.text}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.sunny,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.wb_twighlight,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sunrise",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "Sunset",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${weather!.forecast.forecastday[0].astro.sunrise}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${weather!.forecast.forecastday[0].astro.sunset}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.nightlight,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.mode_night,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Moonrise",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "Moonset",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${weather!.forecast!.forecastday[0].astro.moonset}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${weather!.forecast!.forecastday[0].astro.moonrise}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 125,
                              width: double.infinity,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    weather.forecast.forecastday[0].hour.length,
                                itemBuilder: (context, Hindex) {
                                  int time = int.parse(weather
                                      .forecast.forecastday[0].hour[Hindex].time
                                      .split(' ')[1]
                                      .split(':')[0]);

                                  return Container(
                                    margin: const EdgeInsets.all(9),
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: (time == DateTime.now().hour)
                                          ? Colors.black.withOpacity(0.4)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          weather.forecast.forecastday[0]
                                              .hour[Hindex].time
                                              .toString()
                                              .split(' ')[1],
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Image.network(
                                          "https:${weather.forecast.forecastday[0].hour[Hindex].condition.icon}",
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          "${weather.forecast.forecastday[0].hour[Hindex].tempC}°C",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "UV",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${weather.current.uv}  of 10",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.device_thermostat,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Fell like",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather.current.feelslike_c}°C",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.water_drop_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Humidity",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather.current.humidity}%",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.air,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "ENE wind",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather.current.wind_mph} mph",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.compress,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Air presure",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather.current.pressure_mb} mb",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Visibility",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather.current.vis_km} km",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 95,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.cloud_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Rain chance",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather!.forecast.forecastday[0].day.daily_chance_of_rain} %",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 95,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Snow chance",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${weather!.forecast.forecastday[0].day.daily_chance_of_snow} %",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
