import 'package:dartz/dartz.dart';
import 'package:exemplo_dartz/infra/interfaces/http_request_interface.dart';
import 'package:get/get.dart';

import '../../core/exceptions/exeptions.dart';
import '../services/http_request_service.dart';

class LoginProvider {
  final IHttpRequestService _service = Get.find<HttpRequestService>();

//Provider de login, utilizando o serviço de HTTP passando a rota e o obejeto para o serviço.
  Future<Either<HttpRequestException, bool>> logar(
      {required String login, required String senha}) async {
    var response = await _service.postHttp(
      //caminho do servido para fazer um metodo post utilizando o serviço implantado
      path: "path",
      //objeto passado no exemplo de login
      //poderia ser um modelo separado e fariamos o toMap aqui
      object: {"login": login, "senha": senha},
    );
    return response.fold((error) => left(error), (sucesso) {
      return right(sucesso);
    });
  }
}
