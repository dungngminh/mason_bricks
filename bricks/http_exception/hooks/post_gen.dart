import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running dart format');
  final outputPath =
      '${Directory.current.path}/{{exception_file_name.snakeCase()}}.dart';
  await Process.run('dart', ['format', outputPath]);
  progress.complete();
  context.logger.success('Formatted {{exception_file_name.snakeCase()}}.dart');
}
