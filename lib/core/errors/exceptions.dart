class ServerException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  ServerException(this.message, [this.stackTrace]);
}
