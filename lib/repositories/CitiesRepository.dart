import 'package:grenoble_hands_on_flutter/entities/City.dart';

class CitiesRepository {
  var cities = [
    new City('GRENOBLE', 45.183916, 5.703630),
    new City('SINGAPOUR', 1.295600, 103.858995),
    new City('BORDEAUX', 44.848089, -0.571017),
    new City('BREST', 48.389397, -4.499237),
    new City('MONTREAL', 45.523000, -73.581700),
    new City('LYON', 45.767443, 4.858798),
    new City('RENNES', 48.113409, -1.661249),
    new City('NANTES', 47.207408, -1.556187),
    new City('LILLE', 50.648670, 3.075520),
    new City('PARIS', 48.878932, 2.328487),
  ];

  List<String> getCities() {
    return cities.map((city) => city.name).toList();
  }

  City getCityPosition(String cityName) {
    return cities.firstWhere((city) => city.name == cityName);
  }
}
