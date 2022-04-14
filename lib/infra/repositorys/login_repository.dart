import 'package:dartz/dartz.dart';
import 'package:exemplo_dartz/infra/providers/login_provider.dart';

import '../../core/exceptions/exeptions.dart';
import '../models/login_request.dart';

class LoginRepository {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});
//repository comunica o controller com o provider..
  Future<Either<HttpRequestException, bool>> logar(
      {required LoginRequest request}) async {
    return await loginProvider.logar(request: request);
  }
}
