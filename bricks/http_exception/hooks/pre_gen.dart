import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  String? data;
  try {
    data = await File(context.vars['exception_info_path']).readAsString();
  } catch (e) {
    context.logger.err(
        'Path is not correct, please give full path or correct path of exception_info.json file!');
  }
  try {
    final json = jsonDecode(data!) as List;
    final exceptions = json
        .map((data) => ExceptionInfo(
            type: data['type'],
            message: data['message'],
            statusCode: data['status_code']))
        .map(
          (info) => info.toMap(),
        )
        .toList();
    context.vars = {
      ...context.vars,
      'exceptions': exceptions,
    };
  } catch (e) {
    context.logger
        .err('Read json error! Please check your exception_info.json file!');
    rethrow;
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
