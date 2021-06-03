import 'package:flutter/material.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class RoutesPage extends StatefulWidget {
  Utils utils;

  RoutesPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _RoutesPageState createState() => _RoutesPageState(utils);
}

class _RoutesPageState extends State<RoutesPage> {
  Utils utils;
  bool logged = false;
  String reswueText = "";

  _RoutesPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Rutas"),
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