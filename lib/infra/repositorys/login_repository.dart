import 'package:dartz/dartz.dart';
import 'package:exemplo_dartz/infra/providers/login_provider.dart';

import '../../core/exceptions/exeptions.dart';

class LoginRepository {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});
//repository comunica o controller com o provider..
  Future<Either<HttpRequestException, bool>> logar(
      {required String login, required String senha}) async {
    return await loginProvider.logar(login: login, senha: senha);
  }
}
