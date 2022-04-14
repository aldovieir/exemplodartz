import 'package:exemplo_dartz/infra/models/login_request.dart';
import 'package:exemplo_dartz/infra/providers/login_provider.dart';
import 'package:exemplo_dartz/infra/services/http_request_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HttpRequestService());
  test('Testando serviço de logar', () async {
    LoginRequest request = const LoginRequest(
        login: 'loginController.text', senha: 'passwordController.text');

    var response = await LoginProvider().logar(request: request);

    response.fold((erro) {
      expect(erro.error, "Invalid argument(s): No host specified in URI path");
    }, (sucesso) {
      expect(sucesso, true);
    });
  });
}
