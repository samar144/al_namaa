// To parse this JSON data, do
//
//     final trainingAdvertismentModel = trainingAdvertismentModelFromJson(jsonString);

import 'dart:convert';

List<TrainingAdvertismentModel> trainingAdvertismentModelFromJson(String str) =>
    List<TrainingAdvertismentModel>.from(
        json.decode(str).map((x) => TrainingAdvertismentModel.fromJson(x)));

String trainingAdvertismentModelToJson(List<TrainingAdvertismentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainingAdvertismentModel {
  int? id;
  String? title;
  String? body;
  String? image;
  String? hint;
  dynamic courseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Category>? categories;
  dynamic course;
  List<CategoryAdvertisement>? categoryAdvertisements;

  TrainingAdvertismentModel({
    this.id,
    this.title,
    this.body,
    this.image,
    this.hint,
    this.courseId,
    this.createdAt,
    this.updatedAt,
    this.categories,
    this.course,
    this.categoryAdvertisements,
  });

  factory TrainingAdvertismentModel.fromJson(Map<String, dynamic> json) =>
      TrainingAdvertismentModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        hint: json["hint"],
        courseId: json["course_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        course: json["course"],
        categoryAdvertisements: json["category_advertisements"] == null
            ? []
            : List<CategoryAdvertisement>.from(json["category_advertisements"]!
                .map((x) => CategoryAdvertisement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "image": image,
        "hint": hint,
        "course_id": courseId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "course": course,
        "category_advertisements": categoryAdvertisements == null
            ? []
            : List<dynamic>.from(
                categoryAdvertisements!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class CategoryAdvertisement {
  int? id;
  int? advertisementId;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  CategoryAdvertisement({
    this.id,
    this.advertisementId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory CategoryAdvertisement.fromJson(Map<String, dynamic> json) =>
      CategoryAdvertisement(
        id: json["id"],
        advertisementId: json["advertisement_id"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advertisement_id": advertisementId,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
      };
}
