// // To parse this JSON data, do
// //
// //     final Commentmodel = CommentmodelFromJson(jsonString);

// import 'dart:convert';

// Commentmodel CommentmodelFromJson(String str) =>
//     Commentmodel.fromJson(json.decode(str));

// String CommentmodelToJson(Commentmodel data) => json.encode(data.toJson());

// class Commentmodel {
//   String? id;
//   String? adveretismentId;
//   String? userId;
//   String? body;

//   Commentmodel({
//     this.id,
//     this.adveretismentId,
//     this.userId,
//     this.body,
//   });

//   factory Commentmodel.fromJson(Map<String, dynamic> json) => Commentmodel(
//         id: json["id"],
//         adveretismentId: json["adveretisment_id"],
//         userId: json["user_id"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "adveretisment_id": adveretismentId,
//         "user_id": userId,
//         "body": body,
//       };
// }

// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

// import 'dart:convert';

// List<Commentmodel> commentModelFromJson(String str) => List<Commentmodel>.from(
//     json.decode(str).map((x) => Commentmodel.fromJson(x)));

// String commentModelToJson(List<Commentmodel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Commentmodel {
//   int? id;
//   int? advertisementId;
//   int? userId;
//   String? body;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? image;
//   User? user;

//   Commentmodel({
//     this.id,
//     this.advertisementId,
//     this.userId,
//     this.body,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.user,
//   });

//   factory Commentmodel.fromJson(Map<String, dynamic> json) => Commentmodel(
//         id: json["id"],
//         advertisementId: json["advertisement_id"],
//         userId: json["user_id"],
//         body: json["body"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         image: json["image"],
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "advertisement_id": advertisementId,
//         "user_id": userId,
//         "body": body,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image": image,
//         "user": user?.toJson(),
//       };
// }

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   dynamic address;

//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.address,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         address: json["address"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "address": address,
//       };
// }
// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final commentmodel = commentmodelFromJson(jsonString);

import 'dart:convert';

Commentmodel commentmodelFromJson(String str) =>
    Commentmodel.fromJson(json.decode(str));

String commentmodelToJson(Commentmodel data) => json.encode(data.toJson());

class Commentmodel {
  int? id;
  int? advertisementId;
  int? userId;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Commentmodel({
    this.id,
    this.advertisementId,
    this.userId,
    this.body,
    this.createdAt,
    this.updatedAt,
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
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advertisement_id": advertisementId,
        "user_id": userId,
        "body": body,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
