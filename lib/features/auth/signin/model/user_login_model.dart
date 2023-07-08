// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String email;
  String password;
  int? id;

  UserLoginModel({required this.email, required this.password, this.id});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() =>
      {"email": email, "password": password, "id": id};
}
