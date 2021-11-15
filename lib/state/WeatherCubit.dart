import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

import '../WeatherRepository.dart';

class WeatherCubit extends Cubit<WeatherState> {

  final WeatherRepository _weatherRepository;

  // TODO arg par défault ?
  WeatherCubit(this._weatherRepository) : super(new WeatherState(null, null));

  Future<void> selectCity(String city) async {
    emit(new WeatherState(city, null));
    var weather = await this._weatherRepository.getCityWeather();
    print(weather);
    emit(new WeatherState(city, weather));
  }
}
