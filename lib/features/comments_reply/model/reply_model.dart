// To parse this JSON data, do
//
//     final Reply = ReplyFromJson(jsonString);

import 'dart:convert';

Reply ReplyFromJson(String str) => Reply.fromJson(json.decode(str));

String ReplyToJson(Reply data) => json.encode(data.toJson());

class Reply {
  String? id;
  String? adveretismentId;
  String? userId;
  String? body;

  Reply({
    this.id,
    this.adveretismentId,
    this.userId,
    this.body,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
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
