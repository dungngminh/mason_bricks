# HTTP Exception

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A brick create `http_exception` file based on `.json` user defined for better http exception handling.

## 🚧 Requirements

### `.json` file format requirements

#### Format

```json
[
  {
    "type": "exception_type",
    "code": "exception_code", # optional
    "message": "exception_message"
  }
]
```

- For default,`.json` file must be in `assets/` folder, name is `exception_info.json`, the path will be `assets/exception_info.json` in project
- If you want to use your own `.json` file, you can paste your own path to `exception_info_path` variable.

- `type` is name of exception, it used to create a `class` name that implements `Exception` interface.
- `code` is code of exception, it used to create a `const` `int` value that represents the exception code.
- `message` is message of exception, it used to create a `const` `String` value that represents the exception message.

`.json` file is avaliable in my [assets/](https://github.com/dungngminh/mason_bricks/tree/master/bricks/http_exception/assets) folder in Github repo. You can found it for using like example.

### Example some foo.json file :))

```json
[
  {
    "type": "HttpException",
    "code": 404,
    "message": "Not Found"
  },
  {
    "type": "HttpException",
    "code": 500,
    "message": "Internal Server Error"
  }
]
```

## 🚀 Usage

```sh
mason make http_exception -o ./output-path --exception_info_path path --exception_file_name fileName --use_super_parameters true/false
```

## ✨ Variables

| Variable               | Description                                                                                                                                                                 | Default                      | Type      |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | --------- |
| `exception_info_path`  | Full path of exception_file you define by requirements                                                                                                                      | `assets/exception_info.json` | `string`  |
| `exception_file_name`  | Name of the file after generate, this will be `class` name that implements `Exception` interface and will be `extends` by another specific type `Exception` in `.json` file | `http_exception`             | `string`  |
| `use_super_parameters` | Using contructor with new Dart 2.17 `super_parameters` or not                                                                                                               | `No`                         | `boolean` |

## 📦 Input & Output

### Input

`.json` file

```json
[
  {
    "type": "unauthorized",
    "code": 401,
    "message": "Unauthorized"
  },
  {
    "type": "bad_request",
    "code": 400,
    "message": "Bad Request"
  },
  {
    "type": "timeout",
    "code": 408,
    "message": "Request Timeout"
  },
  {
    "type": "server_error",
    "code": 500,
    "message": "Internal Server Error"
  },
  {
    "type": "unhandled_error",
    "message": "Unhandled Error"
  }
]
```

### Output

Generated a file after format with name `exception_file_name.dart` in `output-path` folder from `exception_info_path` json file path and not use `super_parameters`, this file will be:

```dart
class HttpException implements Exception {
  HttpException({
    this.statusCode,
    this.message = '',
  });

  final String message;
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


```

If use `super_parameters` is `true`, the generated file after format will be like this:

```dart
class HttpException implements Exception {
  HttpException({
    this.statusCode,
    this.message = '',
  });

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      '$runtimeType(message: $message, statusCode: $statusCode)';
}

class UnauthorizedException extends HttpException {
  UnauthorizedException({
    super.statusCode = 401,
    super.message = 'Unauthorized',
  });
}

class BadRequestException extends HttpException {
  BadRequestException({
    super.statusCode = 400,
    super.message = 'Bad Request',
  });
}

class TimeoutException extends HttpException {
  TimeoutException({
    super.statusCode = 408,
    super.message = 'Request Timeout',
  });
}

class ServerErrorException extends HttpException {
  ServerErrorException({
    super.statusCode = 500,
    super.message = 'Internal Server Error',
  });
}

class UnhandledErrorException extends HttpException {
  UnhandledErrorException({
    super.message = 'Unhandled Error',
  });
}

```

[1]: https://github.com/felangel/bloc
[2]: https://github.com/felangel/bloc/tree/master/packages/bloc
[3]: https://github.com/felangel/bloc/tree/master/packages/flutter_bloc
