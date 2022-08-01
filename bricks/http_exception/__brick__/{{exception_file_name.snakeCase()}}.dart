
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
  {{#use_super_parameters}}
   {{type.pascalCase()}}Exception({super.message = '{{message}}'}) : super({{statusCode}});
  {{/use_super_parameters}}
  
  {{#notUsingSuperParams}}
   {{type.pascalCase()}}Exception() : super({{statusCode}}, message:'{{message}}');
  {{/notUsingSuperParams}}
} 
{{/exceptions}}