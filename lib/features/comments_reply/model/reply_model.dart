// To parse this JSON data, do
//
//     final replyModel = replyModelFromJson(jsonString);

import 'dart:convert';

List<ReplyModel> replyModelFromJson(String str) =>
    List<ReplyModel>.from(json.decode(str).map((x) => ReplyModel.fromJson(x)));

String replyModelToJson(List<ReplyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReplyModel {
  int? id;
  int? commentId;
  int? userId;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  ReplyModel({
    this.id,
    this.commentId,
    this.userId,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
        id: json["id"],
        commentId: json["comment_id"],
        userId: json["user_id"],
        body: json["body"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment_id": commentId,
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
