
import 'package:http/http.dart' as http;

class {{class_name.pascalCase()}}{
  {{class_name.pascalCase()}}({
    http.Client? client,
  }) : _client = client ?? http.Client();

  late final http.Client _client;
}