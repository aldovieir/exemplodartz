import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String login;
  final String senha;
  const LoginRequest({
    required this.login,
    required this.senha,
  });

  LoginRequest copyWith({
    String? login,
    String? senha,
  }) {
    return LoginRequest(
      login: login ?? this.login,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'senha': senha,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      login: map['login'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequest(login: $login, senha: $senha)';

  @override
  List<Object> get props => [login, senha];
}
