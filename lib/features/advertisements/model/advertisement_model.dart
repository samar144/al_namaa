// To parse this JSON data, do
//
//     final advertismentModel = advertismentModelFromJson(jsonString);

import 'dart:convert';

AdvertismentModel advertismentModelFromJson(String str) =>
    AdvertismentModel.fromJson(json.decode(str));

String advertismentModelToJson(AdvertismentModel data) =>
    json.encode(data.toJson());

class AdvertismentModel {
  String id;
  String title;
  String body;
  String image;
  String hint;

  AdvertismentModel({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.hint,
  });

  factory AdvertismentModel.fromJson(Map<String, dynamic> json) =>
      AdvertismentModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        hint: json["hint"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "image": image,
        "hint": hint,
      };
}
