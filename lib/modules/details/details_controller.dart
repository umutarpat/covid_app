import 'package:covid_app/global/models/statistics.dart';
import 'package:covid_app/modules/details/details_service.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  Future<Statistics> getStatistics(String country) async {
    return await countryStatistics(country);
  }
}
