import 'package:dartz/dartz.dart';
import '../../core/exceptions/login_failure.dart';

abstract class ILoginInterface {
  Future<Either<LoginServerErrorFailure, bool>> logar(
      {required String login, required String senha});
}
