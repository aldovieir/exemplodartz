import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exceptions/exeptions.dart';
import '../../../core/exceptions/shared/dialogs/loading_dialog.dart';
import '../../../core/exceptions/shared/dialogs/show_error.dart';
import '../../../infra/models/login_request.dart';
import '../../../infra/repositorys/login_repository.dart';
import '../../home/views/home_page.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Rx<bool> carregando = Rx<bool>(false);
  Rx<Option<HttpRequestException>> falha =
      Rx<Option<HttpRequestException>>(none());

  @override
  void onInit() async {
    ever<Option<HttpRequestException>>(
      falha,
      (Option<HttpRequestException> falha) {
        falha.map(
          (HttpRequestException error) {
            showErro(error.error);
          },
        );
      },
    );

    ever<bool>(
      carregando,
      (bool carregando) {
        if (carregando) {
          showLoadingDialog();
        } else {
          hideLoadingDialog();
        }
      },
    );

    super.onInit();
  }

//metodo usado pela view para efetuar o login
  logar() async {
    carregando.value = true;
    await Future.delayed(const Duration(seconds: 3));
    LoginRequest request = LoginRequest(
        login: loginController.text, senha: passwordController.text);
    var response = await repository.logar(request: request);

    response.fold((error) {
      carregando.value = false;
      //navegando com erro pra passar pra tela home
      // Get.off(
      //   const HomePage(),
      // );

      //Tratando erro quando tiver implementação de um serviço para logar
      falha.value = optionOf(error);
    }, (sucesso) async {
      if (sucesso) {
        carregando.value = false;

        //navegando com sucesso do login pra passar pra tela home
        // no caso não funcionará pois não tem serviço implementado
        Get.off(
          const HomePage(),
        );
      }
    });
  }
}
