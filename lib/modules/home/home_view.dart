import 'package:covid_app/global/models/countries.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchField(),
            FutureBuilder<Countries>(
                future: controller.getCountries(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());

                    case ConnectionState.done:
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.results,
                          itemBuilder: (context, i) {
                            return ListTile(
                                title: Text("Country"),
                                trailing: Text(
                                  snapshot.data.response[i],
                                ));
                          });
                      break;
                    default:
                      return Center(child: CircularProgressIndicator());
                      break;
                  }
                })
          ],
        ),
      ),
    );
  }
}
