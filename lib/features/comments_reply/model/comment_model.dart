import 'dart:convert';

List<Commentmodel> commentModelFromJson(String str) => List<Commentmodel>.from(
    json.decode(str).map((x) => Commentmodel.fromJson(x)));

String commentModelToJson(List<Commentmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Commentmodel {
  int? id;
  int? advertisementId;
  int? userId;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  User? user;

  Commentmodel({
    this.id,
    this.advertisementId,
    this.userId,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
  });

  factory Commentmodel.fromJson(Map<String, dynamic> json) => Commentmodel(
        id: json["id"],
        advertisementId: json["advertisement_id"],
        userId: json["user_id"],
        body: json["body"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advertisement_id": advertisementId,
        "user_id": userId,
        "body": body,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  dynamic address;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
      };
}
// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final commentmodel = commentmodelFromJson(jsonString);

// import 'dart:convert';

// Commentmodel commentmodelFromJson(String str) =>
//     Commentmodel.fromJson(json.decode(str));

// String commentmodelToJson(Commentmodel data) => json.encode(data.toJson());
// // String commentmodelToJson(Commentmodel data) {
// //   var userJson = data.user != null ? data.user!.toJson() : null;
// //   return json.encode({
// //     "id": data.id,
// //     "advertisement_id": data.advertisementId,
// //     "user_id": data.userId,
// //     "body": data.body,
// //     "created_at": data.createdAt?.toIso8601String(),
// //     "updated_at": data.updatedAt?.toIso8601String(),
// //     "user": userJson,
// //   });
// // }

// class Commentmodel {
//   int? id;
//   int? advertisementId;
//   int? userId;
//   String? body;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   User? user;

//   Commentmodel({
//     this.id,
//     this.advertisementId,
//     this.userId,
//     this.body,
//     this.createdAt,
//     this.updatedAt,
//     this.user,
//   });

//   factory Commentmodel.fromJson(Map<String, dynamic> json) => Commentmodel(
//       id: json["id"],
//       advertisementId: json["advertisement_id"],
//       userId: json["user_id"],
//       body: json["body"],
//       createdAt: json["created_at"] == null
//           ? null
//           : DateTime.parse(json["created_at"]),
//       updatedAt: json["updated_at"] == null
//           ? null
//           : DateTime.parse(json["updated_at"]),
//       user: json['user'] != null ? User.fromJson(json['user']) : null
//       // user: User.fromJson(json["user"]),
//       // user: json["user"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "advertisement_id": advertisementId,
//         "user_id": userId,
//         "body": body,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "user": user?.toJson(),
//       };
// }

// class User {
//   int? id;
//   String first_name;
//   String lastName;
//   var address;

//   User({
//     this.id,
//     required this.first_name,
//     required this.lastName,
//     this.address,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         first_name: json["first_name"],
//         lastName: json["last_name"],
//         address: json["address"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": first_name,
//         "last_name": lastName,
//         "address": address,
//       };
// }
