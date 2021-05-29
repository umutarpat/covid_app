import 'package:covid_app/global/models/countries.dart';
import 'package:covid_app/global/utilities/consts.dart';
import 'package:dio/dio.dart';

Future<Countries> countryList() async {
  try {
    var response = await Dio().get(
      '${baseURL}countries',
      options: Options(
        headers: {"x-rapidapi-host": "$hostURL", "x-rapidapi-key": "$apiKey"},
      ),
    );
    final countries = countriesFromJson(response.toString());
    print("Success: ${countries.results}");
    return countries;
  } catch (e) {
    print(e);
  }
}
