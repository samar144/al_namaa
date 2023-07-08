// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  String id;
  String adveretismentId;
  String userId;
  String body;

  CommentModel({
    required this.id,
    required this.adveretismentId,
    required this.userId,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        adveretismentId: json["adveretisment_id"],
        userId: json["user_id"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adveretisment_id": adveretismentId,
        "user_id": userId,
        "body": body,
      };
}
