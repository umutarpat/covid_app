import 'package:covid_app/global/models/countries.dart';
import 'package:covid_app/modules/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  test('Countries must not be zero.', () async {
    final controller = Get.put(HomeController());
    Countries countries;
    countries = await controller.getCountries();

    expect(countries.response.length, isNot(equals(0)));
  });
}
