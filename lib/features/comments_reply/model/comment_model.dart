// To parse this JSON data, do
//
//     final Commentmodel = CommentmodelFromJson(jsonString);

import 'dart:convert';

Commentmodel CommentmodelFromJson(String str) =>
    Commentmodel.fromJson(json.decode(str));

String CommentmodelToJson(Commentmodel data) => json.encode(data.toJson());

class Commentmodel {
  String? id;
  String? adveretismentId;
  String? userId;
  String? body;

  Commentmodel({
    this.id,
    this.adveretismentId,
    this.userId,
    this.body,
  });

  factory Commentmodel.fromJson(Map<String, dynamic> json) => Commentmodel(
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
