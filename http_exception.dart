class HttpException implements Exception {
  HttpException({
    this.statusCode,
    this.message,
  });

  final String? message;
  final int? statusCode;

  @override
  String toString() =>
      '$runtimeType(message: $message, statusCode: $statusCode)';
}

class UnauthorizedException extends HttpException {
  UnauthorizedException() : super(statusCode: 401, message: 'Unauthorized');
}

class BadRequestException extends HttpException {
  BadRequestException() : super(statusCode: 400, message: 'Bad Request');
}

class TimeoutException extends HttpException {
  TimeoutException() : super(statusCode: 408, message: 'Request Timeout');
}

class ServerErrorException extends HttpException {
  ServerErrorException()
      : super(statusCode: 500, message: 'Internal Server Error');
}

class UnhandledErrorException extends HttpException {
  UnhandledErrorException() : super(message: 'Unhandled Error');
}
