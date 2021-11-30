import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grenoble_hands_on_flutter/screen/widgets/Navbar.dart';
import 'package:grenoble_hands_on_flutter/state/CitiesCubit.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherCubit.dart';

import 'CityScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar,
      body: BlocBuilder<CitiesCubit, List<String>>(
        builder: (context, state) => ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeader(),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(children: buildList(context, state)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildList(BuildContext context, List<String> state) {
    return state
        .map((city) => ListTile(
              contentPadding: EdgeInsets.only(left: 25),
              title: Text(city),
              onTap: () {
                context.read<WeatherCubit>().selectCity(city);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CityScreen()),
                );
              },
            ))
        .toList();
  }

  Padding buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        "Agences Z",
        style: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
