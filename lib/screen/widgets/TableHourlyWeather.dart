import 'package:flutter/widgets.dart';
import 'package:grenoble_hands_on_flutter/state/WeatherState.dart';

class TableHourlyWeather extends StatelessWidget {
  final WeatherState _state;

  TableHourlyWeather(this._state);

  @override
  Widget build(BuildContext context) {
    return buildTableWeather(_state);
  }

  Widget buildTableWeather(WeatherState state) {
    var textStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Table(
        border: TableBorder.all(color: Color.fromRGBO(54, 54, 54, 0.3)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(10),
          1: FlexColumnWidth(5),
          2: FlexColumnWidth(5),
        },
        children: [
          buildTableHeaderRow(textStyle),
          ...?buildTableContentRow(state),
        ],
      ),
    );
  }

  List<TableRow>? buildTableContentRow(WeatherState state) {
    return state.weatherHourly?.dataseries
        .map((weather) => TableRow(children: [
              Column(children: [
                Text(weather.timepoint.toString(), style: TextStyle(fontSize: 15.0))
              ]),
              Column(children: [
                Image(
                  image: AssetImage(weather.weather + '.png'),
                )
              ]),
              Column(children: [
                Text(weather.temperature.toString() + " C°",
                    style: TextStyle(fontSize: 15.0))
              ]),
            ]))
        .toList();
  }

  TableRow buildTableHeaderRow(TextStyle textStyle) {
    return TableRow(children: [
      Column(children: [
        Container(
            height: 48,
            alignment: Alignment.center,
            child: Text("Date", style: textStyle))
      ]),
      Column(children: [
        Container(
            height: 48,
            alignment: Alignment.center,
            child: Text("Weather", style: textStyle))
      ]),
      Column(children: [
        Container(
            height: 48,
            alignment: Alignment.center,
            child: Text("Temperature", style: textStyle))
      ]),
    ]);
  }
}
