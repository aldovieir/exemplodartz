class LoginFailure implements Exception {}

class LoginServerErrorFailure extends LoginFailure {
  final String error;
  LoginServerErrorFailure({required this.error});
}
