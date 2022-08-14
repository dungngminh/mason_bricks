part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}Event{{#equatable}} extends Equatable{{/equatable}}{
  const {{name.pascalCase()}}Event();
  {{#equatable}}
  @override
  List<Object?> get props => [];{{/equatable}}
}

