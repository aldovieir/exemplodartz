import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exceptions/login_failure.dart';
import '../../../infra/repositorys/login_repository.dart';
import '../../home/views/home_page.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Rx<bool> loading = Rx<bool>(false);
  Rx<Option<LoginServerErrorFailure>> failure =
      Rx<Option<LoginServerErrorFailure>>(none());

  @override
  void onInit() async {
    ever<Option<LoginServerErrorFailure>>(
      failure,
      (Option<LoginServerErrorFailure> failure) {
        failure.map(
          (LoginServerErrorFailure error) {
            Get.dialog(AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 100),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 150.0,
                  height: 40,
                  child: Card(
                    child: Text(error.error),
                  ),
                ),
              ),
            ));
          },
        );
      },
    );

    ever<bool>(
      loading,
      (bool carregando) {
        if (carregando) {
          Get.dialog(AlertDialog(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 100),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: SingleChildScrollView(
              child: SizedBox(
                width: 150.0,
                height: 40,
                child: Card(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text("Carregando..")
                    ],
                  ),
                ),
              ),
            ),
          ));
        }
      },
    );

    super.onInit();
  }

  logar() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    var response = await repository.logar(
        login: loginController.text, senha: passwordController.text);

    response.fold((error) {
      loading.value = false;
      failure.value = optionOf(error);
    }, (sucesso) async {
      if (sucesso) {
        await Future.delayed(const Duration(seconds: 3));
        loading.value = false;
        Get.off(
          const HomePage(),
        );
      }
    });
  }
}
