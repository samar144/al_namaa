import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) =>
    UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) =>
    json.encode(data.toJson());

class UserRegisterModel {
  String email;
  String password;
  String firstname;
  String lastname;
  String fathername;
  String mothername;
  String mobilenumber;
  String telenumber;
  String job;
  String study;
  String city;
  String birthday;

  UserRegisterModel({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.fathername,
    required this.mothername,
    required this.mobilenumber,
    required this.telenumber,
    required this.job,
    required this.study,
    required this.city,
    required this.birthday,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        email: json["email"],
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
      );

  Map<String, dynamic> toJson() => {
        "email": email,
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
      };
}

// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

// import 'dart:convert';

// List<UserRegisterModel> userRegisterModelFromJson(String str) =>
//     List<UserRegisterModel>.from(
//         json.decode(str).map((x) => UserRegisterModel.fromJson(x)));

// String userRegisterModelToJson(List<UserRegisterModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserRegisterModel {
//   int id;
//   String name;
//   String email;
//   Gender gender;
//   Status status;

//   UserRegisterModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.gender,
//     required this.status,
//   });

//   factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
//       UserRegisterModel(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         gender: genderValues.map[json["gender"]]!,
//         status: statusValues.map[json["status"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "gender": genderValues.reverse[gender],
//         "status": statusValues.reverse[status],
//       };
// }

// enum Gender { MALE, FEMALE }

// final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

// enum Status { ACTIVE, INACTIVE }

// final statusValues =
//     EnumValues({"active": Status.ACTIVE, "inactive": Status.INACTIVE});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
