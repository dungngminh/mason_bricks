part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}State{{#equatable}} extends Equatable{{/equatable}}{
  const {{name.pascalCase()}}State();
  {{#equatable}}
  @override
  List<Object?> get props => [];{{/equatable}}
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}