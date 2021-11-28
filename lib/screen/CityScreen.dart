import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/WeatherCubit.dart';
import '../state/WeatherState.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(state.citySelected ?? ""),
                state.loading
                    ? CircularProgressIndicator(
                        strokeWidth: 1.5,
                      )
                    : Table(
                        children: state.weather?.dataseries
                                .map((weather) => TableRow(children: [
                                      Column(children: [
                                        Image(
                                          image: AssetImage(
                                              weather.weather + '.png'),
                                        )
                                      ]),
                                      Column(children: [
                                        Text(weather.date,
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                      Column(children: [
                                        Text(weather.temperature.max.toString(),
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                      Column(children: [
                                        Text(weather.temperature.min.toString(),
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
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
