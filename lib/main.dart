import 'package:flutter/material.dart';
import 'package:ingress_key_manager/pages/login.page.dart';
import 'package:ingress_key_manager/util/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.red,
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
      ),
      home: LoginPage(Utils()),
    );
  }
}
