import 'dart:convert';
import 'dart:developer';

import 'package:ingress_key_manager/generated/json/key_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/key_per_user_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/operation_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/user_d_t_o_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/user_entity_helper.dart';
import 'package:ingress_key_manager/generated/json/route_entity_helper.dart';
import 'package:ingress_key_manager/models/key_entity.dart';
import 'package:ingress_key_manager/models/operation_entity.dart';
import 'package:ingress_key_manager/models/user_entity.dart';
import 'package:ingress_key_manager/models/user_d_t_o_entity.dart';
import 'package:ingress_key_manager/models/key_per_user_entity.dart';
import 'package:ingress_key_manager/models/route_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ingress_key_manager/util/constants.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  SharedPreferences prefs;

  Utils() {
    SharedPreferences.getInstance().then((pref) => prefs = pref);
  }

  Future<UserEntity> createUser(String username, String email, String password) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointUsers),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': username, 'email': email, 'password': password}),
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
      body: jsonEncode(<String, String>{'username': username.trim(), 'password': password}),
    );
    if (response.statusCode == 200) {
      setStringSharedPref(Constants.usernameKey, username.trim());
      setStringSharedPref(Constants.reswueTokenKey, "");
      return response.headers["authorization"];
    } else {
      return "fail";
    }
  }

  Future<bool> isResWueLogged() async {
    bool outdated = await isResTokenOutdated();
    if (prefs.getString(Constants.reswueTokenKey).isNotEmpty && prefs.getString(Constants.reswueTokenKey) != null) {
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
    final response = await http
        .get(Uri.http(Constants.baseUrl, Constants.endpointOutdated + "/" + prefs.getString(Constants.usernameKey)), headers: <String, String>{
      'Authorization': prefs.getString(Constants.apiTokenKey),
    });
    if (response.statusCode == 200) {
      bool out = bool.fromEnvironment(response.body);
      if (!out) {
        setStringSharedPref(Constants.reswueTokenKey, "token");
      }
      return out;
    }
    return false;
  }

  initiateUser() async {
    final response =
        await http.get(Uri.http(Constants.baseUrl, Constants.endpointUsers + "/" + prefs.getString(Constants.usernameKey)), headers: <String, String>{
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
    final response = await http.get(Uri.http(Constants.baseUrl, Constants.endpointReswueURL), headers: <String, String>{
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
        <String, String>{'code': code, 'user_name': prefs.getString(Constants.usernameKey)},
      ),
    );
    if (response.statusCode == 200) {
      setStringSharedPref(Constants.reswueTokenKey, "token");
    } else {
      throw Exception('Failed to initiate.');
    }
  }

  Future<OperationEntity> getOperationList() async {
    final response = await http.get(
        Uri.http(
          Constants.baseUrl,
          Constants.endpointOperations + prefs.getInt(Constants.idKey).toString(),
        ),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    OperationEntity operationEntity = OperationEntity();
    if (response.statusCode == 200) {
      operationEntity = operationEntityFromJson(operationEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return operationEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  Future<KeyEntity> getKeyList(String slug) async {
    final response = await http.get(
        Uri.http(
          Constants.baseUrl,
          Constants.endpointOperations + prefs.getInt(Constants.idKey).toString() + "/" + slug,
        ),
        headers: <String, String>{
          'Authorization': prefs.getString(Constants.apiTokenKey),
        });
    KeyEntity keyEntity = KeyEntity();
    if (response.statusCode == 200) {
      keyEntity = keyEntityFromJson(keyEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return keyEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  Future<KeyPerUserEntity> getKeysPerPortal(int portalId) async {
    final response = await http.get(Uri.http(Constants.baseUrl, Constants.endpointPortalKeys + portalId.toString()), headers: <String, String>{
      'Authorization': prefs.getString(Constants.apiTokenKey),
    });
    KeyPerUserEntity keyPerUserEntity = KeyPerUserEntity();
    if (response.statusCode == 200) {
      keyPerUserEntity = keyPerUserEntityFromJson(keyPerUserEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return keyPerUserEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  Future<KeyPerUserEntity> getKeysPerUser(String username) async {
    final response = await http.get(Uri.http(Constants.baseUrl, Constants.endpointPortalKeys + "user/" + username), headers: <String, String>{
      'Authorization': prefs.getString(Constants.apiTokenKey),
    });
    KeyPerUserEntity keyPerUserEntity = KeyPerUserEntity();
    if (response.statusCode == 200) {
      keyPerUserEntity = keyPerUserEntityFromJson(keyPerUserEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return keyPerUserEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  void addKeys(int portalId, String text) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointPortalKeys),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'portal': portalId.toString(), 'user': prefs.getInt(Constants.idKey).toString(), 'quantity': text},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to initiate.');
    }
  }

  void editKeys(int keyPerUserID, int number) async {
    final response = await http.put(
      Uri.http(Constants.baseUrl, Constants.endpointPortalKeys + keyPerUserID.toString()),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'quantity': "-" + number.toString()},
      ),
    );
    if (response.statusCode != 200) {
      log(response.statusCode.toString());
      throw Exception('Failed to initiate.');
    }
  }

  Future<RouteEntity> getRoutes() async {
    final response = await http.get(Uri.http(Constants.baseUrl, Constants.endpointRoutes), headers: <String, String>{
      'Authorization': prefs.getString(Constants.apiTokenKey),
    });
    RouteEntity routeEntity = RouteEntity();
    if (response.statusCode == 200) {
      routeEntity = routeEntityFromJson(routeEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return routeEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  Future<RouteEntity> getRoutesOfUser(String username) async {
    final response = await http.get(Uri.http(Constants.baseUrl, Constants.endpointRoutes + username), headers: <String, String>{
      'Authorization': prefs.getString(Constants.apiTokenKey),
    });
    RouteEntity routeEntity = RouteEntity();
    if (response.statusCode == 200) {
      routeEntity = routeEntityFromJson(routeEntity, jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
      return routeEntity;
    } else {
      throw Exception('Failed to load operation list');
    }
  }

  void addRoute(String name, String username) async {
    Map<String, dynamic> body = {
      'name': name,
      'user': {'username': username}
    };
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointRoutes),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        body,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to initiate.');
    }
  }

  void addRouteStop(int id, String username) async {
    Map<String, dynamic> body = {
      'route': {'route_id': id},
      'user': {'username': username}
    };
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointRoutesStops),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        body,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to initiate.');
    }
  }

  void addRouteKeys(int id, int idPortal, int quantity) async {
    Map<String, dynamic> body = {
      'route': {'route_id': id},
      'portal': {'portal_id': idPortal},
      'quantity': quantity
    };
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointRoutesKeys),
      headers: <String, String>{
        'Authorization': prefs.getString(Constants.apiTokenKey),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        body,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to initiate.');
    }
  }
}
