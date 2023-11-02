class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() => message;
}

class ConnectionException implements Exception {
  @override
  final String message;
  ConnectionException(this.message) : super();
  @override
  String toString() => message;
}
