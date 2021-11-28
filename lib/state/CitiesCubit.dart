import 'package:bloc/bloc.dart';
import 'package:grenoble_hands_on_flutter/repositories/CitiesRepository.dart';

class CitiesCubit extends Cubit<List<String>> {
  CitiesRepository citiesRepository;

  CitiesCubit(this.citiesRepository) : super(citiesRepository.getCities());
}
