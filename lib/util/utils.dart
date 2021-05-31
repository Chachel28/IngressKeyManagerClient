import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ingress_key_manager/generated/json/user_d_t_o_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/user_entity_helper.dart';
import 'package:ingress_key_manager/models/user_entity.dart';
import 'package:ingress_key_manager/models/user_d_t_o_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ingress_key_manager/util/constants.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  SharedPreferences prefs;

  Utils() {
    SharedPreferences.getInstance().then((pref) => prefs = pref);
  }

  Future<UserEntity> createUser(
      String username, String email, String password) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointUsers),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      var user = UserEntity();
      userEntityFromJson(user, jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Failed to create user.');
    }
  }

  Future<String> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username.trim(), 'password': password}),
    );
    if (response.statusCode == 200) {
      setStringSharedPref(Constants.usernameKey, username.trim());
      return response.headers["authorization"];
    } else {
      throw Exception('Failed to login.');
    }
  }

  bool isResWueLogged() {
    log("checking reswue");
    if (prefs.getKeys().contains(Constants.reswueTokenKey)) {
      log("reswue has token");
      bool outdated = isResTokenOutdated();
      if (!outdated) {
        log("reswue key --------->" + prefs.getString(Constants.reswueTokenKey));
        return true;
      }
    }
    return false;
  }

  String getStringSharedPref(String key) {
    return prefs.getString(key);
  }

  void setStringSharedPref(String key, String value) {
    prefs.setString(key, value);
  }

  isResTokenOutdated() async {
    log("checking if is outdated");
    final response = await http.get(Uri.http(
        Constants.baseUrl,
        Constants.endpointOutdated +
            "/" +
            prefs.getString(Constants.usernameKey)));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  initiateUser() async {
    final response = await http.get(Uri.http(
        Constants.baseUrl,
        Constants.endpointUsers +
            "/" +
            prefs.getString(Constants.usernameKey)),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    if (response.statusCode == 200) {
      var user = UserDTOEntity();
      userDTOEntityFromJson(user, jsonDecode(response.body));
      log("email ------------> " + user.email);
      prefs.setString(Constants.emailKey, user.email);
      return response.headers["authorization"];
    } else {
      throw Exception('Failed to initiate.');
    }
  }
}
