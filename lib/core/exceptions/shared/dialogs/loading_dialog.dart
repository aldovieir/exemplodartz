import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Chama apenas um [ Get.back() ] e fecha o loading atual. É boa prática usar ele
/// pois chamar um Get.back() no meio do código pode confundir, aqui mostramos que
/// estamos chamando ele para fechar o dialog do loading.
void hideLoadingDialog() {
  Get.back();
}

/// Mostra um Dialog de loading que não pode ser fechado
showLoadingDialog() {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        backgroundColor: Colors.white,
        children: <Widget>[
          Center(
            child: Column(children: const [
              CircularProgressIndicator(
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Aguarde....",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400),
              )
            ]),
          )
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
