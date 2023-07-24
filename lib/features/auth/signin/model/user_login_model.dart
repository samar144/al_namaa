// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String? email;
  String? password;
  int? id;
  String? token;
  String? name;

  UserLoginModel({this.email, this.password, this.id, this.name, this.token});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
        id: json["id"],
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "id": id,
        "name": name,
        "token": token
      };
}
