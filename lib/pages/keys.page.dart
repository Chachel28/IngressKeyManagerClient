import 'package:flutter/material.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class KeysPage extends StatefulWidget {
  Utils utils;

  KeysPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _KeysPageState createState() => _KeysPageState(utils);
}

class _KeysPageState extends State<KeysPage> {
  Utils utils;
  bool logged = false;
  String reswueText = "";

  _KeysPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Llaves"),
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