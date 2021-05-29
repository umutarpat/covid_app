import 'package:covid_app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

searchField() {
  final HomeController controller = Get.find();
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: TextField(
        keyboardType: TextInputType.visiblePassword,
        controller: controller.searchTextController,
        onChanged: (value) {
          controller.countries.value =
              controller.getCountries(searchText: value);
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              controller.searchTextController.clear();
              controller.countries.value =
                  controller.getCountries(searchText: "");
            },
          ),
          fillColor: Colors.blue,
          focusColor: Colors.blue,
          hoverColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(width: 1, color: Colors.blue),
          ),
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        )),
  );
}
