import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grenoble_hands_on_flutter/state/CitiesCubit.dart';

import 'CityScreen.dart';
import 'state/WeatherCubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Z Weather"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child:
                  Text("Agences Z", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            Expanded(child: BlocBuilder<CitiesCubit, List<String>>(
              builder: (context, state) {
                return ListView(
                  children: <Widget>[
                    ...state.map((city) => ListTile(
                          contentPadding: EdgeInsets.only(left: 25),
                          title: Text(city),
                          onTap: () {
                            context.read<WeatherCubit>().selectCity(city);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CityScreen()),
                            );
                          },
                        )),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
