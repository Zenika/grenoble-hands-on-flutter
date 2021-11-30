import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

import '../repositories/WeatherRepository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(new WeatherState());

  Future<void> selectCity(String city) async {
    await _fetchWeather(city, WeatherMode.DAILY);
  }

  Future<void> _fetchWeather(String city, WeatherMode mode) async {
    emit(new WeatherState(citySelected: city, loading: true));
    if (mode == WeatherMode.DAILY) {
      var weather = await this._weatherRepository.getCityDailyWeather(city);
      emit(
        new WeatherState(
          citySelected: city,
          weatherDaily: weather,
          loading: false,
          mode: mode,
        ),
      );
    } else {
      var weather = await this._weatherRepository.getCityHourlyWeather(city);
      emit(
        new WeatherState(
          citySelected: city,
          weatherHourly: weather,
          loading: false,
          mode: mode,
        ),
      );
    }
  }

  Future<void> selectMode(WeatherMode mode) async {
    await _fetchWeather(state.citySelected, mode);
  }
}
