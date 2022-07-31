
class {{exception_file_name.pascalCase()}} implements Exception {
  {{exception_file_name.pascalCase()}}(
    this.statusCode, {
    this.message = '',
  });

  final String message;
  final int statusCode;

  @override
  String toString() {
    return '$statusCode: $message';
  }
}
{{#exceptions}}
class {{type.pascalCase()}}Exception extends {{exception_file_name.pascalCase()}}{
  {{type.pascalCase()}}Exception({super.message = '{{message}}'}) : super({{statusCode}});
} 
{{/exceptions}}