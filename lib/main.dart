import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grenoble_hands_on_flutter/repositories/CitiesRepository.dart';
import 'package:grenoble_hands_on_flutter/repositories/WeatherRepository.dart';
import 'package:grenoble_hands_on_flutter/screen/ui/Colors.dart';
import 'package:grenoble_hands_on_flutter/state/CitiesCubit.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherCubit.dart';

import 'screen/HomeScreen.dart';

var citiesRepository = new CitiesRepository();
var weatherRepository = new WeatherRepository(citiesRepository);

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          return WeatherCubit(weatherRepository);
        }),
        BlocProvider(create: (_) => CitiesCubit(citiesRepository)),
      ],
      child: MaterialApp(
        title: 'Zenika Cities weather',
        theme: ThemeData(
          primarySwatch: MAIN_MATERIAL_COLOR,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
