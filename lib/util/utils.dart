import 'dart:convert';
import 'dart:developer';

import 'package:ingress_key_manager/generated/json/key_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/operation_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/user_d_t_o_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/user_entity_helper.dart';
import 'package:ingress_key_manager/models/key_entity.dart';
import 'package:ingress_key_manager/models/operation_entity.dart';
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

  Future<bool> isResWueLogged() async {
    log("checking reswue");
    bool outdated = await isResTokenOutdated();
    if (prefs.getString(Constants.reswueTokenKey).isNotEmpty &&
        prefs.getString(Constants.reswueTokenKey) != null) {
      if (!outdated) {
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

  Future<bool> isResTokenOutdated() async {
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
    final response = await http.get(
        Uri.http(
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
      prefs.setInt(Constants.idKey, user.userId);
      prefs.setString(Constants.emailKey, user.email);
      prefs.setString(Constants.userImageKey, user.avatar);
      return response.headers["authorization"];
    } else {
      throw Exception('Failed to initiate.');
    }
  }

  Future<String> getReswueURL() async {
    final response = await http.get(
        Uri.http(Constants.baseUrl, Constants.endpointReswueURL),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to initiate.');
    }
  }

  createReswueToken(String code) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointReswueToken),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'code': code,
          'user_name': prefs.getString(Constants.usernameKey)
        },
      ),
    );
    if (response.statusCode == 200) {
      log(response.body);
      setStringSharedPref(Constants.reswueTokenKey, response.body);
    } else {
      throw Exception('Failed to initiate.');
    }
  }

  Future<OperationEntity> getOperationList() async {
    final response = await http.get(
        Uri.http(
          Constants.baseUrl,
          Constants.endpointOperations +
              prefs.getInt(Constants.idKey).toString(),
        ),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    OperationEntity operationEntity = OperationEntity();
    if (response.statusCode == 200) {
      operationEntity =
          operationEntityFromJson(operationEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return operationEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  Future<KeyEntity> getKeyList(String slug) async {
    final response = await http.get(
        Uri.http(
          Constants.baseUrl,
          Constants.endpointOperations +
              prefs.getInt(Constants.idKey).toString() +
              "/" +
              slug,
        ),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    KeyEntity keyEntity = KeyEntity();
    if (response.statusCode == 200) {
      keyEntity = keyEntityFromJson(keyEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      log(keyEntity.toString());
      return keyEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }
}
