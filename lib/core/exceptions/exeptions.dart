class HttpRequestException implements Exception {
  final String error;
  HttpRequestException({required this.error});
}
