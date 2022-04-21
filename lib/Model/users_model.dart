// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    required this.name,
    required this.email,
    required this.password,
    required this.fbUser,
    required this.taxId,
    required this.address,
    required this.street,
    required this.building,
    required this.city,
    required this.governrate,
    required this.area,
  });

  String name;
  String email;
  String password;
  String fbUser;
  String taxId;
  String address;
  String street;
  String building;
  String city;
  String governrate;
  String area;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    fbUser: json["fbUser"],
    taxId: json["taxId"],
    address: json["address"],
    street: json["street"],
    building: json["building"],
    city: json["city"],
    governrate: json["governrate"],
    area: json["area"],
  );

  Map<String, dynamic> toJson() => {
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
    "area": area,
  };
}
