import 'package:covid_app/global/models/statistics.dart';
import 'package:covid_app/modules/details/details_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('Statistics must not be zero.', () async {
    final controller = Get.put(DetailsController());
    Statistics statistics;
    statistics = await controller.getStatistics("usa");

    expect(statistics.response.length, isNot(equals(0)));
  });
}
