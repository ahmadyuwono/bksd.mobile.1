import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muba/utilities/const.dart';

class LoginModel {
  LoginModel({
    required this.token,
    required this.name,
    required this.user_id,
    required this.email,
    required this.status,
  });

  final String token;
  final String name;
  final String user_id;
  final String email;
  final int status;

  factory LoginModel.createLoginModel(Map<String, dynamic> object) {
    return LoginModel(
      token: object['token'],
      name: object['name'],
      user_id: object['user_id'],
      email: object['email'],
      status: object['status'],
    );
  }

  static Future<LoginModel> integrateAPI(String email, String password) async {
    String apiURL = "${Constants.baseUri}/api/auth/login";
    var response = await http.post(Uri.parse(apiURL), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      return LoginModel.createLoginModel(jsonObject);
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }
}
