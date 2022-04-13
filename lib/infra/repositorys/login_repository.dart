import 'package:dartz/dartz.dart';
import 'package:exemplo_dartz/infra/providers/login_provider.dart';

import '../../core/exceptions/login_failure.dart';

class LoginRepository {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});

  Future<Either<LoginServerErrorFailure, bool>> logar(
      {required String login, required String senha}) async {
    return await loginProvider.logar(login: login, senha: senha);
  }
}
