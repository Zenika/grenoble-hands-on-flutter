import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(new WeatherState(null));

  void selectCity(String city) {
    emit(new WeatherState(city));
  }
}
