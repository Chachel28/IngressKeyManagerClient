import 'package:flutter/material.dart';
import 'package:ingress_key_manager/pages/home.page.dart';
import 'package:ingress_key_manager/pages/login.page.dart';
import 'package:ingress_key_manager/pages/scaffold.page.dart';
import 'package:ingress_key_manager/util/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var utils = Utils();
  runApp(MyApp(utils));
}

class MyApp extends StatelessWidget {
  var utils;
  MyApp(Utils utils){
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {'/': (context) => LoginPage(utils), '/homePage': (context) => ScaffoldPage(utils)},
    );
  }
}
