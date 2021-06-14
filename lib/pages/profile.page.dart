import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ingress_key_manager/pages/reswue.register.page.dart';
import 'package:ingress_key_manager/util/utils.dart';
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class ProfilePage extends StatefulWidget {
  Utils utils;

  ProfilePage(Utils utils) {
    this.utils = utils;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState(utils);
}

class _ProfilePageState extends State<ProfilePage> {
  Utils utils;
  bool logged = false;
  String reswueText = "";

  _ProfilePageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: Icon(Icons.power_settings_new_sharp),
          ),
        ],
        title: Text(utils.getStringSharedPref(Constants.usernameKey)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: buildProfileImage(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ...ListTile.divideTiles(
                            color: Colors.grey,
                            tiles: [
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Usuario"),
                                subtitle: Text(
                                  utils.getStringSharedPref(
                                    Constants.usernameKey,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.email),
                                title: Text("Email"),
                                subtitle: Text(
                                  utils.getStringSharedPref(
                                    Constants.emailKey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text("Reswue"),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: logged ? Colors.red : Colors.blue),
                                      onPressed: () => {logged ? logOutReswue() : logInReswue()},
                                      child: Text(
                                        '$reswueText',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   child: Row(
                              //     children: [
                              //       Flexible(
                              //         child: ListTile(
                              //           leading: Icon(Icons.person),
                              //           title: Text("Telegram"),
                              //         ),
                              //       ),
                              //       buildTelegramButton(),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildReswueButton() async {
    logged = await utils.isResWueLogged();
    if (logged) {
      setState(() {
        reswueText = "Salir de Reswue";
      });
    } else {
      setState(() {
        reswueText = "Entrar en Reswue";
      });
    }
  }

  buildTelegramButton() {
    return Text("WIP");
  }

  buildProfileImage() {
    if (utils.getStringSharedPref(Constants.userImageKey) != null && utils.getStringSharedPref(Constants.userImageKey).isNotEmpty) {
      return NetworkImage(utils.getStringSharedPref(Constants.userImageKey));
    }
    return AssetImage("images/key.jpg");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      buildReswueButton();
    });
  }

  logOutReswue() {
    utils.setStringSharedPref(Constants.reswueTokenKey, "");
    log(utils.getStringSharedPref(Constants.reswueTokenKey));
    logged = false;
    setState(() {
      reswueText = "Entrar en Reswue";
    });
  }

  logInReswue() {
    if (utils.getStringSharedPref(Constants.codeKey).isEmpty || utils.getStringSharedPref(Constants.codeKey) == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReswueRegisterPage(utils),
        ),
      );
      logged = true;
      setState(() {
        reswueText = "Salir de Reswue";
      });
    }
  }
}
