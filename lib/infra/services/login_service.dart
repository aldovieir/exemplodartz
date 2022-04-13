import 'package:exemplo_dartz/core/exceptions/login_failure.dart';

import 'package:dartz/dartz.dart';

import '../interfaces/login_interface.dart';

class LoginService implements ILoginInterface {
  @override
  Future<Either<LoginServerErrorFailure, bool>> logar(
      {required String login, required String senha}) async {
    left(LoginServerErrorFailure(error: 'erro ao logar'));
    return right(true);
  }
}
