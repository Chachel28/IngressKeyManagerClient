import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  _ProfilePageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                    buildReswueButton(),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text("Telegram"),
                                      ),
                                    ),
                                    buildTelegramButton(),
                                  ],
                                ),
                              ),
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

  buildReswueButton() {
    return (utils.isResWueLogged())
        ? Text("Reswue logeado")
        : ElevatedButton(
            onPressed: () {},
            child: Text(
              "Entrar en Reswue",
            ),
          );
  }

  buildTelegramButton() {
    return Text("WIP");
  }

  buildProfileImage() {
    if (utils.getStringSharedPref(Constants.userImageKey) != null) {
      return NetworkImage(utils.getStringSharedPref(Constants.userImageKey));
    }
    return AssetImage("images/key.jpg");
  }
}
