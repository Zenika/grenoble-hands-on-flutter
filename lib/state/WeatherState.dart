import 'package:grenoble_hands_on_flutter/entities/Weather.dart';

class WeatherState  {
  final String? citySelected;
  final Weather? weather;
  final bool loading;

  WeatherState({this.citySelected, this.weather, this.loading = false});
}
