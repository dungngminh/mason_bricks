import 'package:flutter/material.dart';
import 'package:get/get.dart';

class {{name.pascalCase()}}Page extends GetView<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('{{name.pascalCase()}}'),
      ),
      body: Center(
        child: Text(controller.name),
      ),
    
    );
  }
}