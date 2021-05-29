import 'package:covid_app/modules/home/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future getCountries() {
    return countryList();
  }
}
