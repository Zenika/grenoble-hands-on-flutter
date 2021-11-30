import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grenoble_hands_on_flutter/entities/City.dart';
import 'package:grenoble_hands_on_flutter/entities/WeatherDaily.dart';
import 'package:grenoble_hands_on_flutter/entities/WeatherHourly.dart';
import 'package:grenoble_hands_on_flutter/repositories/CitiesRepository.dart';

class WeatherRepository {
  CitiesRepository citiesRepository;

  WeatherRepository(this.citiesRepository);

  Future<WeatherHourly?> getCityHourlyWeather(cityName) async {
    City city = this.citiesRepository.getCityPosition(cityName);
    var response = await new Dio().get<String>(
        "https://www.7timer.info/bin/civil.php?lon=" +
            city.longitude.toString() +
            "&lat=" +
            city.latitude.toString() +
            "&ac=0&unit=metric&output=json&tzshift=0");
    print(response.data);
    return WeatherHourly.fromJson(json.decode(response.data ?? ''));
  }

  Future<WeatherDaily?> getCityDailyWeather(cityName) async {
    City city = this.citiesRepository.getCityPosition(cityName);
    var response = await new Dio().get<String>(
        "https://www.7timer.info/bin/civillight.php?lon=" +
            city.longitude.toString() +
            "&lat=" +
            city.latitude.toString() +
            "&ac=0&unit=metric&output=json&tzshift=0");
    return WeatherDaily.fromJson(json.decode(response.data ?? ''));
  }
}
