abstract class Exception {
  final String? message;
  Exception(this.message);

  @override
  String toString() => message ?? 'Exception';
}

class InputException implements Exception {
  final String? message;
  InputException(this.message);

  @override
  String toString() => message ?? 'InputException';
}

class ServerException implements Exception {
  final String? message;
  ServerException(this.message);

  @override
  String toString() => message ?? 'ServerException';
}
