import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

import '../repositories/WeatherRepository.dart';

class WeatherCubit extends Cubit<WeatherState> {

  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(new WeatherState());

  Future<void> selectCity(String city) async {
    emit(new WeatherState(citySelected: city, loading: true));
    var weather = await this._weatherRepository.getCityWeather(city);
    emit(new WeatherState(citySelected: city, weather: weather, loading: false));
  }
}
