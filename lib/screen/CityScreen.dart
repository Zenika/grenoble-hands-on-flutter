import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grenoble_hands_on_flutter/screen/ui/Colors.dart';
import 'package:grenoble_hands_on_flutter/screen/widgets/Navbar.dart';
import 'package:grenoble_hands_on_flutter/screen/widgets/TableDailyWeather.dart';
import 'package:grenoble_hands_on_flutter/screen/widgets/TableHourlyWeather.dart';

import '../state/WeatherCubit.dart';
import '../state/WeatherState.dart';

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar,
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[buildPanel(state, context)],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Card buildPanel(WeatherState state, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildPanelHeader(state),
          buildModeButtons(state, context),
          state.loading ? buildLoader() : buildTableWeather(state)
        ],
      ),
    );
  }

  Widget buildTableWeather(WeatherState state) {
    return state.mode == WeatherMode.DAILY
        ? TableDailyWeather(state)
        : TableHourlyWeather(state);
  }

  Widget buildPanelHeader(WeatherState state) {
    return Container(
      decoration: new BoxDecoration(color: MAIN_COLOR),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        state.citySelected,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget buildModeButtons(WeatherState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Wrap(direction: Axis.horizontal, spacing: 10, children: <Widget>[
        ButtonTheme(
          minWidth: 40.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: state.mode == WeatherMode.DAILY
                  ? MAIN_MATERIAL_COLOR
                  : Colors.white,
            ),
            onPressed: () {
              context.read<WeatherCubit>().selectMode(WeatherMode.DAILY);
            },
            child: Text("Daily"),
          ),
        ),
        ButtonTheme(
          minWidth: 40.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: state.mode == WeatherMode.HOURLY
                  ? MAIN_MATERIAL_COLOR
                  : Colors.white,
            ),
            onPressed: () {
              context.read<WeatherCubit>().selectMode(WeatherMode.HOURLY);
            },
            child: Text("Hourly"),
          ),
        ),
      ]),
    );
  }

  Widget buildLoader() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}
