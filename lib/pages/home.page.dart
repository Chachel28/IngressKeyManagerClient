import 'package:flutter/material.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/models/key_per_user_entity.dart';
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: FutureBuilder<KeyPerUserEntity>(
                    future: utils.getKeysPerUser(utils.getStringSharedPref(Constants.usernameKey)),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Lista de llaves",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                              textAlign: TextAlign.center,
                            ),
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: snapshot.data.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      '${snapshot.data.data[index].portal.portalName} -> ${snapshot.data.data[index].quantity}',
                                    ),
                                  );
                                }),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      }
                      // By default, show a loading spinner.
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
