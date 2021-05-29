import 'package:covid_app/global/models/statistics.dart';
import 'package:covid_app/global/utilities/consts.dart';
import 'package:dio/dio.dart';

Future<Statistics> countryStatistics(String country) async {
  try {
    var response = await Dio().get(
      '$statisticsURL',
      queryParameters: {"country": country},
      options: Options(
        headers: {"x-rapidapi-host": "$hostURL", "x-rapidapi-key": "$apiKey"},
      ),
    );
    final statistics = statisticsFromJson(response.toString());

    print("Success: ${statistics.results}");
    return statistics;
  } catch (e) {
    print(e);
  }
}
