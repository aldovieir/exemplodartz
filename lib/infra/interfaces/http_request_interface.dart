import 'package:dartz/dartz.dart';
import '../../core/exceptions/exeptions.dart';

abstract class IHttpRequestService {
  // Interface de implementação do método
  Future<Either<HttpRequestException, dynamic>> postHttp<T>({
    required String path,
    required T object,
  });
}
