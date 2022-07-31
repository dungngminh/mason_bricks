import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.success('Generated {{exception_file_name.snakeCase()}}.dart');
}
