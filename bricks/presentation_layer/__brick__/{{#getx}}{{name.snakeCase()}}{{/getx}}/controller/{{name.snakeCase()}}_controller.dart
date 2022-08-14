import 'package:get/get.dart';

class {{name.pascalCase()}}Controller extends GetxController{
  final name = RxString('{{name.pascalCase()}} is working');

  @override
  void onInit() {
    super.onInit();
    print('Hi from {{name.pascalCase()}}Controller');
  }
}
