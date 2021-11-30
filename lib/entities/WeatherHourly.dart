class WeatherHourly {
  const WeatherHourly({
    required this.dataseries,
  });

  final List<DataSeries> dataseries;

  factory WeatherHourly.fromJson(Map<String, dynamic> json) => WeatherHourly(
      dataseries: (json['dataseries'] as List)
          .map((e) => DataSeries.fromJson(e))
          .toList());
}

class DataSeries {
  final int timepoint;
  final String weather;
  final int temperature;

  DataSeries(
      {required this.timepoint,
      required this.weather,
      required this.temperature});

  factory DataSeries.fromJson(Map<String, dynamic> json) => DataSeries(
        timepoint: json['timepoint'] as int,
        weather: json['weather'],
        temperature: json["temp2m"] as int,
      );
}
