part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State{{#equatable}} extends Equatable{{/equatable}}{
  {{#equatable}}
  @override
  List<Object?> get props => [];{{/equatable}}
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}
