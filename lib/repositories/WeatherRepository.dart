
import 'package:grenoble_hands_on_flutter/entities/Weather.dart';
import 'package:grenoble_hands_on_flutter/repositories/CitiesRepository.dart';

class WeatherRepository {
  CitiesRepository citiesRepository;

  WeatherRepository(this.citiesRepository);

  Future<Weather?> getCityWeather(cityName) async {
    // City city = this.citiesRepository.getCityPosition(cityName);
    // var response = await new Dio().get<String>(
    //     "https://www.7timer.info/bin/civillight.php?lon=" +
    //         city.longitude.toString() +
    //         "&lat=" +
    //         city.latitude.toString() +
    //         "&ac=0&unit=metric&output=json&tzshift=0");
    // return Weather.fromJson(json.decode(response.data ?? ''));

    return Weather.fromJson({
      "product": "civillight",
      "init": "2021112800",
      "dataseries": [
        {
          "date": 20211128,
          "weather": "oshower",
          "temp2m": {"max": 33, "min": 25},
          "wind10m_max": 3
        },
        {
          "date": 20211129,
          "weather": "mcloudy",
          "temp2m": {"max": 35, "min": 24},
          "wind10m_max": 3
        },
        {
          "date": 20211130,
          "weather": "pcloudy",
          "temp2m": {"max": 35, "min": 24},
          "wind10m_max": 3
        },
        {
          "date": 20211201,
          "weather": "pcloudy",
          "temp2m": {"max": 34, "min": 23},
          "wind10m_max": 3
        },
        {
          "date": 20211202,
          "weather": "pcloudy",
          "temp2m": {"max": 34, "min": 23},
          "wind10m_max": 3
        },
        {
          "date": 20211203,
          "weather": "clear",
          "temp2m": {"max": 34, "min": 23},
          "wind10m_max": 3
        },
        {
          "date": 20211204,
          "weather": "clear",
          "temp2m": {"max": 34, "min": 23},
          "wind10m_max": 3
        }
      ]
    });
  }
}
