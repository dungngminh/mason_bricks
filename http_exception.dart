
class HttpException implements Exception {
  HttpException(
    this.statusCode, {
    this.message = '',
  });

  final String message;
  final int statusCode;

  @override
  String toString() {
    return '$statusCode: $message';
  }
}

class UnauthorizedException extends HttpException{
  
  
  
   UnauthorizedException() : super(401, message:'Unauthorized');
  
} 

class BadRequestException extends HttpException{
  
  
  
   BadRequestException() : super(400, message:'Bad Request');
  
} 

class TimeoutException extends HttpException{
  
  
  
   TimeoutException() : super(408, message:'Request Timeout');
  
} 

class ServerErrorException extends HttpException{
  
  
  
   ServerErrorException() : super(500, message:'Internal Server Error');
  
} 
