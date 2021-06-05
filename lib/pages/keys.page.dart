import 'package:flutter/material.dart';
import 'package:ingress_key_manager/models/key_entity.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                            return ListTile(
                              title: Center(
                                child: Text('${snapshot.data.data[index].name}'),
                              ),
                              onTap: () {
                                //TODO: llevar al recuento de llaves
                              },
                            );
                          });
                      ;
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
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
    );
  }

  // buildOperationList() {
  //   return FutureBuilder(
  //     future: isReswueLogged,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         if (!snapshot.data) {
  //           return Text(
  //             "Tienes que estar logeado en Reswue para ver la lista de operaciones",
  //           );
  //         }
  //         return ;
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       }
  //       // By default, show a loading spinner.
  //       return CircularProgressIndicator();
  //     },
  //   );
  // }

}
