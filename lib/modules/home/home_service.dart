import 'package:covid_app/global/models/countries.dart';
import 'package:covid_app/global/utilities/consts.dart';
import 'package:dio/dio.dart';

Future<Countries> countryList(String searchText) async {
  try {
    var response = await Dio().get(
      '$countriesURL',
      options: Options(
        headers: {"x-rapidapi-host": "$hostURL", "x-rapidapi-key": "$apiKey"},
      ),
    );
    final countries = countriesFromJson(response.toString());
    countries.response = (searchText != ""
        ? countries.response
            .where((country) =>
                country.toLowerCase().contains(searchText.toLowerCase()))
            .toList()
        : countries.response);
    print("Success: ${countries.results}");
    return countries;
  } catch (e) {
    print(e);
  }
}
