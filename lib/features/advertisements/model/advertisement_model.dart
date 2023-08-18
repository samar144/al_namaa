// To parse this JSON data, do
//
//     final advertismentModel = advertismentModelFromJson(jsonString);

import 'dart:convert';

List<AdvertismentModel> advertismentModelFromJson(String str) =>
    List<AdvertismentModel>.from(
        json.decode(str).map((x) => AdvertismentModel.fromJson(x)));

String advertismentModelToJson(List<AdvertismentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertismentModel {
  int? id;
  String? title;
  String? body;
  String? image;
  String? hint;
  int? courseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Category>? categories;
  Course? course;
  List<CategoryAdvertisement>? categoryAdvertisements;

  AdvertismentModel({
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

  factory AdvertismentModel.fromJson(Map<String, dynamic> json) =>
      AdvertismentModel(
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
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
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
        "course": course?.toJson(),
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

class Course {
  int? id;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  String? sessionNumber;
  String? sessionDuration;
  String? trainerName;
  String? targetGroup;
  int? premium;
  String? category;
  String? status;
  List<CourseDay>? courseDays;

  Course({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.sessionNumber,
    this.sessionDuration,
    this.trainerName,
    this.targetGroup,
    this.premium,
    this.category,
    this.status,
    this.courseDays,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        sessionNumber: json["session_number"],
        sessionDuration: json["session_duration"],
        trainerName: json["trainer_name"],
        targetGroup: json["target_group"],
        premium: json["premium"],
        category: json["category"],
        status: json["status"],
        courseDays: json["course_days"] == null
            ? []
            : List<CourseDay>.from(
                json["course_days"]!.map((x) => CourseDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "session_number": sessionNumber,
        "session_duration": sessionDuration,
        "trainer_name": trainerName,
        "target_group": targetGroup,
        "premium": premium,
        "category": category,
        "status": status,
        "course_days": courseDays == null
            ? []
            : List<dynamic>.from(courseDays!.map((x) => x.toJson())),
      };
}

class CourseDay {
  int? id;
  int? courseId;
  String? day;
  String? startTime;
  String? endTime;

  CourseDay({
    this.id,
    this.courseId,
    this.day,
    this.startTime,
    this.endTime,
  });

  factory CourseDay.fromJson(Map<String, dynamic> json) => CourseDay(
        id: json["id"],
        courseId: json["course_id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
      };
}
