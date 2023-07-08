// To parse this JSON data, do
//
//     final ideaModel = ideaModelFromJson(jsonString);

import 'dart:convert';

IdeaModel ideaModelFromJson(String str) => IdeaModel.fromJson(json.decode(str));

String ideaModelToJson(IdeaModel data) => json.encode(data.toJson());

class IdeaModel {
  String id;
  String userId;
  String idea;
  String targetGroup;
  String impelementaion;
  String cost;
  String timing;
  String profit;
  String goal;
  String note;
  String name;
  String phoneNumber;
  String anonymous;

  IdeaModel({
    required this.id,
    required this.userId,
    required this.idea,
    required this.targetGroup,
    required this.impelementaion,
    required this.cost,
    required this.timing,
    required this.profit,
    required this.goal,
    required this.note,
    required this.name,
    required this.phoneNumber,
    required this.anonymous,
  });

  factory IdeaModel.fromJson(Map<String, dynamic> json) => IdeaModel(
        id: json["id"],
        userId: json["user_id"],
        idea: json["idea"],
        targetGroup: json["target_group"],
        impelementaion: json["impelementaion"],
        cost: json["cost"],
        timing: json["timing"],
        profit: json["profit"],
        goal: json["goal"],
        note: json["note"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        anonymous: json["anonymous"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "idea": idea,
        "target_group": targetGroup,
        "impelementaion": impelementaion,
        "cost": cost,
        "timing": timing,
        "profit": profit,
        "goal": goal,
        "note": note,
        "name": name,
        "phone_number": phoneNumber,
        "anonymous": anonymous,
      };
}
