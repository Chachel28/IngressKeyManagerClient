import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class ReswueRegisterPage extends StatefulWidget {
  Utils utils;

  ReswueRegisterPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _ReswueRegisterPageState createState() => _ReswueRegisterPageState();
}

class _ReswueRegisterPageState extends State<ReswueRegisterPage> {
  final codeController = TextEditingController();
  ChromeSafariBrowser chromeSafariBrowser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.utils.getStringSharedPref(Constants.usernameKey)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Introduzca el codigo aqui",
                    ),
                    maxLines: 2000,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (codeController.text.isNotEmpty &&
                      codeController.text != null) {
                    widget.utils.setStringSharedPref(
                        Constants.codeKey, codeController.text);

                    widget.utils.createReswueToken(
                        widget.utils.getStringSharedPref(Constants.codeKey));
                    widget.utils.setStringSharedPref(Constants.codeKey, "");
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Mandar codigo",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.utils
        .getReswueURL()
        .then((value) => chromeSafariBrowser.open(url: Uri.parse(value)));
  }
}
