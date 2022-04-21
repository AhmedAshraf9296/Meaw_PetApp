import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meaw/main.dart';
import 'package:meaw/utils/my_string.dart';

class UserServices {
  static Future postUser(
  String name,
  String email,
  String password,
  String fbUser,
  String taxId,
  String address,
  String street,
  String building,
  String city,
  String governrate,
  String area) async {
    HttpOverrides.global = MyHttpOverrides();
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(Uri.parse("$baseUrlApis/customers"),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "fbUser": fbUser,
          "taxId": taxId,
          "address": address,
          "street": street,
          "building": building,
          "city": city,
          "governrate": governrate,
          "area": area
        }),headers: headers);
    if (response.statusCode == 200) {
      var jsonData = response.body;

      return jsonData;
    }
    else{
      return throw Exception("Failed to post the data");
    }
  }
}
