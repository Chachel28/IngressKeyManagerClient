import 'dart:convert';
import 'dart:developer';

import 'package:ingress_key_manager/generated/json/user_entity_helper.dart';
import 'package:ingress_key_manager/models/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ingress_key_manager/util/constants.dart' as Constants;

class UserUtils{
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
      throw Exception('Failed to create album.');
    }
  }

  Future<String> loginUser(
      String username, String password) async {
    final response = await http.post(
      Uri.http(Constants.baseUrl, Constants.endpointLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      String token = response.headers["authorization"];
      return token;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}