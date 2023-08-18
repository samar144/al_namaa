// To parse this JSON data, do
//
//     final sonsorProfileModel = sonsorProfileModelFromJson(jsonString);

import 'dart:convert';

SonsorProfileModel sonsorProfileModelFromJson(String str) =>
    SonsorProfileModel.fromJson(json.decode(str));

String sonsorProfileModelToJson(SonsorProfileModel data) =>
    json.encode(data.toJson());

class SonsorProfileModel {
  var id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  var birth;
  dynamic study;
  var phoneNumber;
  var teleNumber;
  dynamic job;
  String? email;
  var deviceToken;
  String? note;
  var sponsorActive;
  var nationalNumber;
  String? gender;
  var addressId;
  var deletedAt;
  var finalBalance;
  Address? address;
  List<dynamic>? wallets;

  SonsorProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.birth,
    this.study,
    this.phoneNumber,
    this.teleNumber,
    this.job,
    this.email,
    this.deviceToken,
    this.note,
    this.sponsorActive,
    this.nationalNumber,
    this.gender,
    this.addressId,
    this.deletedAt,
    this.finalBalance,
    this.address,
    this.wallets,
  });

  factory SonsorProfileModel.fromJson(Map<String, dynamic> json) =>
      SonsorProfileModel(
        id: json["id"].toString(),
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        birth: json["birth"],
        study: json["study"],
        phoneNumber: json["phone_number"],
        teleNumber: json["tele_number"],
        job: json["job"],
        email: json["email"],
        deviceToken: json["device_token"].toString(),
        note: json["note"],
        sponsorActive: json["sponsor_active"].toString(),
        nationalNumber: json["national_number"].toString(),
        gender: json["gender"],
        addressId: json["address_id"],
        deletedAt: json["deleted_at"],
        finalBalance: json["final_balance"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        wallets: json["wallets"] == null
            ? []
            : List<dynamic>.from(json["wallets"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "birth": birth,
        "study": study,
        "phone_number": phoneNumber,
        "tele_number": teleNumber,
        "job": job,
        "email": email,
        "device_token": deviceToken.toString(),
        "note": note,
        "sponsor_active": sponsorActive.toString(),
        "national_number": nationalNumber.toString(),
        "gender": gender,
        "address_id": addressId.toString(),
        "deleted_at": deletedAt,
        "final_balance": finalBalance,
        "address": address?.toJson(),
        "wallets":
            wallets == null ? [] : List<dynamic>.from(wallets!.map((x) => x)),
      };
}

class Address {
  var id;
  String? country;
  String? state;
  String? city;
  String? street;

  Address({
    this.id,
    this.country,
    this.state,
    this.city,
    this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"].toString(),
        country: json["country"],
        state: json["state"],
        city: json["city"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "country": country,
        "state": state,
        "city": city,
        "street": street,
      };
}
