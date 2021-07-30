import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterModel {
  RegisterModel({
    required this.nik,
    required this.name,
    required this.password,
    required this.email,
    required this.negara,
    required this.membership,
  });

  final String nik;
  final String name;
  final String password;
  final String email;
  final String negara;
  final String membership;

  factory RegisterModel.createRegisterModel(Map<String, dynamic> object) {
    return RegisterModel(
      nik: object['nik'],
      name: object['name'],
      password: object['password'],
      email: object['email'],
      negara: object['negara'],
      membership: object['membership'],
    );
  }

  static Future<RegisterModel> integrateAPI(String nik, String name,
      String email, String password, String negara, String membership) async {
    String apiURL = "https://muba.socketspace.com/api/auth/register";
    var response = await http.post(Uri.parse(apiURL), body: {
      "nik": nik,
      "name": name,
      "email": email,
      "password": password,
      "negara": negara,
      "membership": membership,
    });
    var jsonObject = jsonDecode(response.body);

    return RegisterModel.createRegisterModel(jsonObject);
  }
}
