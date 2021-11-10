import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/WeatherCubit.dart';
import 'state/WeatherState.dart';

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Z Weather"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(state.citySelected ?? "")],
          ),
        );
      }),
    );
  }
}

// Image(
// image: AssetImage('sunny.png'),
// )
