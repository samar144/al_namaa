import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? email;
  String? name;
  String? password;
  String? first_name;
  String? last_name;
  String? father_name;
  String? mother_name;
  String? phone_number;
  String? tele_number;
  String? job;
  String? study;
  String? city;
  var birth;
  String? token;
  String? street;

  String? country;

  String? state;

  String? cpassword;
  int? role;

  UserModel({
    this.email,
    this.password,
    this.first_name,
    this.id,
    this.token,
    this.name,
    this.street,
    this.country,
    this.cpassword,
    this.state,
    this.last_name,
    this.role = 4,
    this.father_name,
    this.mother_name,
    this.phone_number,
    this.tele_number,
    this.job,
    this.study,
    this.city,
    this.birth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"],
      id: json['id'],
      password: json["password"],
      cpassword: json["c_password"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      father_name: json["father_name"],
      mother_name: json["mother_name"],
      phone_number: json["phone_number"],
      tele_number: json["telenumber"],
      job: json["job"],
      study: json["study"],
      city: json["city"],
      street: json["street"],
      state: json["state"],
      country: json["country"],
      birth: json["birth"],
      role: json['role'],
      token: json['token'],
      name: json['name']);

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "password": password,
        "c_password": cpassword,
        "street": street,
        "state": state,
        "country": country,
        "first_name": first_name,
        "last_name": last_name,
        "father_name": father_name,
        "mother_name": mother_name,
        "phone_number": phone_number,
        "telenumber": tele_number,
        "job": job,
        "study": study,
        "city": city,
        "birth": birth,
        "role": role,
        "token": token,
        "name": name,
      };
}
