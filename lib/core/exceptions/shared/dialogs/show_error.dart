import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErro(String texto) async {
  Get.dialog(AlertDialog(
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    content: SingleChildScrollView(
      child: SizedBox(
        width: 150.0,
        height: 150,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(texto),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("ok"),
              )
            ],
          ),
        ),
      ),
    ),
  ));
}
