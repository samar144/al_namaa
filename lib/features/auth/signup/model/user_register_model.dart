import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String email;
  String password;
  String firstname;
  String lastname;
  String? fathername;
  String? mothername;
  String mobilenumber;
  String? telenumber;
  String? job;
  String? study;
  String? city;
  String? birthday;
  // int? role;

  UserModel({
    required this.email,
    required this.password,
    required this.firstname,
    this.id,
    required this.lastname,
    // this.role=5,
    this.fathername,
    this.mothername,
    required this.mobilenumber,
    this.telenumber,
    this.job,
    this.study,
    this.city,
    this.birthday,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        id: json['id'],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        fathername: json["fathername"],
        mothername: json["mothername"],
        mobilenumber: json["mobilenumber"],
        telenumber: json["telenumber"],
        job: json["job"],
        study: json["study"],
        city: json["city"],
        birthday: json["birthday"],
        // role: json['role']
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "fathername": fathername,
        "mothername": mothername,
        "mobilenumber": mobilenumber,
        "telenumber": telenumber,
        "job": job,
        "study": study,
        "city": city,
        "birthday": birthday,
        // "role":role
      };
}
