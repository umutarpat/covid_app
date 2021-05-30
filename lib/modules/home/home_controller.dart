import 'package:covid_app/global/models/countries.dart';
import 'package:covid_app/modules/home/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchTextController = TextEditingController();
  var countries = Future.value(Countries()).obs;
  @override
  void onInit() async {
    super.onInit();
    countries.value = getCountries();
  }

  Future<Countries> getCountries({String searchText = ""}) async {
    return await countryList(searchText);
  }
}
