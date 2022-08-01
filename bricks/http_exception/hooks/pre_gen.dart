import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  String path;
  final userInputPath = context.vars['exception_info_path'];
  if (userInputPath == 'assets/exception_info.json') {
    final directory = Directory.current.path;
    path = directory + '/${userInputPath}';
  } else {
    path = userInputPath;
  }
  try {
    final data = await File(path).readAsString();
    if (data.trim().isEmpty) {
      throw FileEmptyException();
    }
    final decoded = jsonDecode(data) as List;
    final exceptions = decoded
        .map(
          (data) => ExceptionInfo(
            type: data['type'],
            message: data['message'],
            statusCode: data['code'],
          ),
        )
        .map(
          (info) => info.toMap(),
        )
        .toList();
    context.vars = {
      ...context.vars,
      'exceptions': exceptions,
    };
  } on FileEmptyException {
    logger.alert(
      red.wrap(
        'File is empty, please check exception_info.json again!',
      ),
    );
    throw Exception();
  } on FormatException {
    logger.alert(
      red.wrap(
        'Converting fromJson has error, please check exception_info.json again!',
      ),
    );
    throw Exception();
  } on FileSystemException {
    logger.alert(
      red.wrap(
        'Path is not correct, '
        'please give full path or correct path of exception_info.json file!',
      ),
    );
    throw Exception();
  } on Exception catch (e) {
    throw e;
  }
}

class ExceptionInfo {
  const ExceptionInfo({
    required this.type,
    required this.statusCode,
    required this.message,
  });

  final String type;
  final int statusCode;
  final String message;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'statusCode': statusCode,
      'message': message,
    };
  }
}

class FileEmptyException implements Exception {}
