
class WeatherDaily {
  const WeatherDaily({
    required this.dataseries,
  });

  final List<DataSeries> dataseries;

  factory WeatherDaily.fromJson(Map<String, dynamic> json) => WeatherDaily(
      dataseries: (json['dataseries'] as List)
          .map((e) => DataSeries.fromJson(e))
          .toList());
}

class DataSeries {
  final String date;
  final String weather;
  final Temperature temperature;

  DataSeries(
      {required this.date, required this.weather, required this.temperature});

  factory DataSeries.fromJson(Map<String, dynamic> json) => DataSeries(
    date: (json['date'] as int).toString(),
    weather: json['weather'],
    temperature: Temperature.fromJson(json["temp2m"]),
  );
}

class Temperature {
  final int max;
  final int min;

  Temperature(this.max, this.min);

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      Temperature(json['max'] as int, json['min'] as int);
}
