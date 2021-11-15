import 'package:grenoble_hands_on_flutter/WeatherRepository.dart';

class WeatherState  {
  final String? citySelected;
  final Weather? weather;

  WeatherState(this.citySelected, this.weather);
}
