// To parse this JSON data, do
//
//     final ideaModel = ideaModelFromJson(jsonString);

import 'dart:convert';

IdeaModel ideaModelFromJson(String str) => IdeaModel.fromJson(json.decode(str));

String ideaModelToJson(IdeaModel data) => json.encode(data.toJson());

class IdeaModel {
  String? id;
  String? userId;
  String? idea;
  String? cost;
  String? profit;
  String? ideatitle;

  // String targetGroup;
  // String impelementaion;
  // String timing;
  // String goal;
  // String name;
  // String phoneNumber;
  // String anonymous;

  IdeaModel({
    this.id,
    this.userId,
    this.idea,
    this.cost,
    this.ideatitle,
    // required this.name,
    // required this.targetGroup,
    // required this.impelementaion,
    // required this.timing,
    this.profit,
    // required this.goal,
    // required this.phoneNumber,
    // required this.anonymous,
  });

  factory IdeaModel.fromJson(Map<String, dynamic> json) => IdeaModel(
        id: json["id"],
        userId: json["user_id"],
        idea: json["idea"],
        cost: json["cost"],
        ideatitle: json["note"],
        // name: json["name"],
        // targetGroup: json["target_group"],
        // impelementaion: json["impelementaion"],
        // timing: json["timing"],
        profit: json["profit"],
        // goal: json["goal"],
        // phoneNumber: json["phone_number"],
        // anonymous: json["anonymous"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "idea": idea,
        "cost": cost,
        "note": ideatitle,
        // "name": name,
        // "target_group": targetGroup,
        // "impelementaion": impelementaion,
        // "timing": timing,
        "profit": profit,
        // "goal": goal,
        // "phone_number": phoneNumber,
        // "anonymous": anonymous,
      };
}
