import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  Progress? formatProgress;
  Progress? fixProgress;
  try {
    /// Formating
    final formatProgress = context.logger.progress('Running dart format');
    final outputPath = Directory.current.path;
    await Process.run('dart', ['format', outputPath])
        .onError((_, __) => throw FormatProgressException());
    formatProgress.complete();
    context.logger.success('Formatted {{name.pascalCase()}} module');

    /// Fixing
    fixProgress =
        context.logger.progress('Running dart fix for fixing linter warning');
    await Process.run('dart', ['fix', '--apply'])
        .onError((_, __) => throw FixProgressException());
    fixProgress.complete();
    context.logger.success('Fixed {{name.pascalCase()}} module');
  } on FormatProgressException {
    formatProgress?.fail('Format progress failed, please try again');
  } on FixProgressException {
    fixProgress?.fail('Fix progress failed, please try again');
  }
}

class FormatProgressException implements Exception {}

class FixProgressException implements Exception {}
