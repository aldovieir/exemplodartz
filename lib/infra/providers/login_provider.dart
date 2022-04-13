import 'package:dartz/dartz.dart';
import 'package:exemplo_dartz/infra/interfaces/login_interface.dart';
import 'package:get/get.dart';

import '../../core/exceptions/login_failure.dart';
import '../services/login_service.dart';

class LoginProvider {
  final ILoginInterface _service = Get.find<LoginService>();

  Future<Either<LoginServerErrorFailure, bool>> logar(
      {required String login, required String senha}) async {
    return await _service.logar(login: login, senha: senha);
  }
}
