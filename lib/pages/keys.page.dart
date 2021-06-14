import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ingress_key_manager/models/key_entity.dart';
import 'package:ingress_key_manager/models/key_per_user_entity.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class KeysPage extends StatefulWidget {
  Utils utils;
  String slug;

  KeysPage(Utils utils, String slug) {
    this.utils = utils;
    this.slug = slug;
  }

  @override
  _KeysPageState createState() => _KeysPageState(utils);
}

class _KeysPageState extends State<KeysPage> {
  Future<KeyEntity> keys;
  Utils utils;
  bool logged = false;
  Future<bool> isReswueLogged;
  String reswueText = "";
  var keyController = TextEditingController();

  _KeysPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  void initState() {
    super.initState();
    keys = utils.getKeyList(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/homePage'));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Portales de ${widget.slug}"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<KeyEntity>(
                    future: keys,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var portalId = snapshot.data.data[index].portalId;
                              return ListTile(
                                title: Text(
                                  '${snapshot.data.data[index].portalName}',
                                ),
                                subtitle: Text(
                                  '${snapshot.data.data[index].keys}',
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              "Llaves de ${snapshot.data.data[index].portalName}",
                                            ),
                                            content: Container(
                                              width: double.maxFinite,
                                              child: FutureBuilder<KeyPerUserEntity>(
                                                future: utils.getKeysPerPortal(snapshot.data.data[index].portalId),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        ListView.builder(
                                                            scrollDirection: Axis.vertical,
                                                            shrinkWrap: true,
                                                            padding: const EdgeInsets.all(8),
                                                            itemCount: snapshot.data.data.length,
                                                            itemBuilder: (BuildContext context, int index) {
                                                              return ListTile(
                                                                title: Text(
                                                                  '${snapshot.data.data[index].user.username} -> ${snapshot.data.data[index].quantity}',
                                                                ),
                                                              );
                                                            }),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                  context: context,
                                                                  builder: (context) {
                                                                    return AlertDialog(
                                                                      content: Container(
                                                                        width: double.maxFinite,
                                                                        child: Column(
                                                                          children: [
                                                                            TextField(
                                                                              controller: keyController,
                                                                              keyboardType: TextInputType.number,
                                                                            ),
                                                                            ElevatedButton(
                                                                              onPressed: () {
                                                                                utils.addKeys(portalId, keyController.text);
                                                                                Navigator.pushReplacement(
                                                                                  context,
                                                                                  MaterialPageRoute(builder: (BuildContext context) => super.widget),
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                "Añadir",
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Text(
                                                                "Añadir llaves",
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                utils.editKeys(snapshot.data.data[index].keyId, snapshot.data.data[index].quantity);
                                                                Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(builder: (BuildContext context) => super.widget),
                                                                );
                                                              },
                                                              child: Text(
                                                                "Eliminar llaves",
                                                              ),
                                                            )
                                                          ],
                                                        )
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
                                          );
                                        });
                                  },
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      }
                      // By default, show a loading spinner.
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
