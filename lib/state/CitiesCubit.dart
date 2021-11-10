import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

class CitiesCubit extends Cubit<List<String>> {
  CitiesCubit() : super(["GRENOBLE", "BORDEAUX"]);
}
