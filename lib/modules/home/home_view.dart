import 'package:covid_app/global/models/countries.dart';
import 'package:covid_app/modules/details/details_view.dart';
import 'package:covid_app/modules/home/home_controller.dart';
import 'package:covid_app/modules/home/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Covid App"),
          centerTitle: true,
        ),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  searchField(),
                  FutureBuilder<Countries>(
                      future: controller.countries.value,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());

                          case ConnectionState.done:
                            return snapshot.data.response.length > 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data.response.length,
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          print("tapped");
                                          Get.to(() => Details(
                                              snapshot.data.response[i]));
                                        },
                                        child: ListTile(
                                          title: Text("Country"),
                                          trailing: Text(
                                            snapshot.data.response[i],
                                          ),
                                        ),
                                      );
                                    })
                                : Container(child: Text("No data"));
                            break;
                          default:
                            return Center(child: CircularProgressIndicator());
                            break;
                        }
                      })
                ],
              ),
            )));
  }
}
