import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grenoble_hands_on_flutter/WeatherRepository.dart';
import 'package:grenoble_hands_on_flutter/state/CitiesCubit.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherCubit.dart';

import 'HomeScreen.dart';

var weatherRepository = new WeatherRepository();

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
        BlocProvider(create: (_) => CitiesCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
