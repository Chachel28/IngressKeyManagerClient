import 'package:flutter/material.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class HomePage extends StatefulWidget {
  Utils utils;

  HomePage(Utils utils) {
    this.utils = utils;
  }

  @override
  _HomePageState createState() => _HomePageState(utils);
}

class _HomePageState extends State<HomePage> {
  Utils utils;
  bool logged = false;
  String reswueText = "";

  _HomePageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Inicio"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(

          ),
        ),
      ),
    );
  }
}
