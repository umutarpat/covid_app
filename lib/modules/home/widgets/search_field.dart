import 'package:flutter/material.dart';
import 'package:get/get.dart';

searchField() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: TextField(
        keyboardType: TextInputType.visiblePassword,
        /*    controller: _controller, */

        onChanged: (value) {
          /*    setState(() {}); */
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              /*   _controller.clear();
                setState(() {}); */
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
