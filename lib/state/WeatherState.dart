import 'package:grenoble_hands_on_flutter/entities/WeatherDaily.dart';
import 'package:grenoble_hands_on_flutter/entities/WeatherHourly.dart';

class WeatherState  {
  final String citySelected;
  final WeatherDaily? weatherDaily;
  final WeatherHourly? weatherHourly;
  final bool loading;
  final WeatherMode mode;

  WeatherState({this.citySelected = "", this.weatherDaily, this.weatherHourly, this.loading = false, this.mode = WeatherMode.DAILY});
}

enum WeatherMode {
  DAILY, HOURLY
}
