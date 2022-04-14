import 'package:exemplo_dartz/infra/repositorys/login_repository.dart';
import 'package:exemplo_dartz/modulos/login/controller/login_controller.dart';
import 'package:get/get.dart';

import 'infra/providers/login_provider.dart';
import 'infra/services/http_request_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpRequestService>(HttpRequestService());

    Get.put<LoginController>(LoginController(
        repository: LoginRepository(loginProvider: LoginProvider())));
  }
}
