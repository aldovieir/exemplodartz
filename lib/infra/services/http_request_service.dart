import 'package:dio/dio.dart';
import 'package:exemplo_dartz/core/exceptions/exeptions.dart';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../interfaces/http_request_interface.dart';

class HttpRequestService extends GetxService implements IHttpRequestService {
  final Dio _dio = Dio();

//Serviço de requisições http utilizando o [DIO] implementado apenas o metodo de post
//recebendo um [path] que e a rota para o servidor. e um objeto Json para enviarmos para o servido
  @override
  Future<Either<HttpRequestException, dynamic>> postHttp<T>(
      {required String path, required T object}) async {
    try {
      var response = await _dio.post(path, data: object);
      return right(response.data);
    } on DioError catch (dioError) {
      return left(HttpRequestException(error: dioError.message));
    }
  }
}
