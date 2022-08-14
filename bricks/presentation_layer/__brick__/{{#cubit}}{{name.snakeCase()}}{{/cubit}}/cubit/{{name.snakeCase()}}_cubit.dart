import 'package:flutter_bloc/flutter_bloc.dart';
{{#equatable}}import 'package:equatable/equatable.dart';{{/equatable}}

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}Initial());
}
