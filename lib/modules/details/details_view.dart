import 'package:covid_app/global/models/statistics.dart';
import 'package:covid_app/global/utilities/tools.dart';
import 'package:covid_app/modules/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  String country;
  Details(this.country);
  final controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
        ),
        body: FutureBuilder<Statistics>(
            future: controller.getStatistics(country),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  return Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          ListTile(
                              title: Text("Country"),
                              trailing:
                                  Text(snapshot.data.response[0].country)),
                          ListTile(
                              title: Text("Population"),
                              trailing: Text(numberFormatter.format(
                                  snapshot.data.response[0].population))),
                          ListTile(
                              title: Text("Total Cases"),
                              trailing: Text(numberFormatter.format(
                                  snapshot.data.response[0].cases.total))),
                          ListTile(
                              title: Text("Total Deaths"),
                              trailing: Text(numberFormatter.format(
                                  snapshot.data.response[0].deaths.total))),
                          ListTile(
                              title: Text("Total Cases"),
                              trailing: Text(numberFormatter.format(
                                  snapshot.data.response[0].cases.total))),
                          ListTile(
                              title: Text("Total Tests"),
                              trailing: Text(numberFormatter.format(
                                  snapshot.data.response[0].tests.total))),
                        ],
                      ));
                  break;
                default:
                  return Center(child: CircularProgressIndicator());
                  break;
              }
            }));
  }
}
