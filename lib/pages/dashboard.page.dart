import 'package:flutter/material.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class DashboardPage extends StatefulWidget {
  Utils utils;

  DashboardPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _DashboardPageState createState() => _DashboardPageState(utils);
}

class _DashboardPageState extends State<DashboardPage> {
  Utils utils;
  bool logged = false;
  String reswueText = "";

  _DashboardPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Panel de control"),
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