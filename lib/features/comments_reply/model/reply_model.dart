// To parse this JSON data, do
//
//     final replyModel = replyModelFromJson(jsonString);

import 'dart:convert';

ReplyModel replyModelFromJson(String str) =>
    ReplyModel.fromJson(json.decode(str));

String replyModelToJson(ReplyModel data) => json.encode(data.toJson());

class ReplyModel {
  bool? success;
  List<Reply>? data;
  String? message;

  ReplyModel({
    this.success,
    this.data,
    this.message,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Reply>.from(json["data"]!.map((x) => Reply.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Reply {
  int? id;
  int? commentId;
  int? userId;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Reply({
    this.id,
    this.commentId,
    this.userId,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
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
