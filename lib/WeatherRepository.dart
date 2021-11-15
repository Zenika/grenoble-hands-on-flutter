import 'package:dio/dio.dart';

class WeatherRepository {
  Future<Weather?> getCityWeather() async {
    var response = await new Dio().get<Weather>(
        "https://www.7timer.info/bin/civillight.php?lon=45&lat=5&ac=0&unit=metric&output=json&tzshift=0");
    return response.data;
  }
}

class Weather {
  const Weather({
    required this.dataseries,
  });

  final List<DataSeries> dataseries;
}

class DataSeries {
  final String date;
  final String weather;

  DataSeries({required this.date, required this.weather});
}
