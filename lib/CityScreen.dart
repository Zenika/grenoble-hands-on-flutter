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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(state.citySelected ?? ""),
            Table(
              children: state.weather?.dataseries
                      .map((weather) => TableRow(children: [
                            Column(children: [Text(weather.weather, style: TextStyle(fontSize: 20.0))]),
                            Column(children: [Text('Tutorial', style: TextStyle(fontSize: 20.0))]),
                            Column(children: [Text('Review', style: TextStyle(fontSize: 20.0))]),
                          ]))
                      .toList() ??
                  [],
            )
          ]),
        );
      }),
    );
  }
}

// Image(
// image: AssetImage('sunny.png'),
// )
