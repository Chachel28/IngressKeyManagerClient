import 'package:flutter/material.dart';
import 'package:ingress_key_manager/models/operation_entity.dart';
import 'package:ingress_key_manager/pages/keys.page.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class OperationPage extends StatefulWidget {
  Utils utils;

  OperationPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _OperationPageState createState() => _OperationPageState(utils);
}

class _OperationPageState extends State<OperationPage> {
  Future<OperationEntity> operations;
  Utils utils;
  bool logged = false;
  Future<bool> isReswueLogged;
  String reswueText = "";

  _OperationPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  void initState() {
    operations = utils.getOperationList();
    isReswueLogged = utils.isResWueLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Operaciones"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [buildOperationList()],
          ),
        ),
      ),
    );
  }

  buildOperationList() {
    return FutureBuilder(
      future: isReswueLogged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data) {
            return Text(
              "Tienes que estar logeado en Reswue para ver la lista de operaciones",
            );
          }
          return Expanded(
            child: FutureBuilder<OperationEntity>(
              future: operations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Center(
                            child: Text('${snapshot.data.data[index].slug}'),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KeysPage(utils, snapshot.data.data[index].slug),
                              ),
                            );
                          },
                        );
                      });
                  ;
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                // By default, show a loading spinner.
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
