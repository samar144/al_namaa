// To parse this JSON data, do
//
//     final guarantees = guaranteesFromJson(jsonString);

import 'dart:convert';

Guarantees guaranteesFromJson(String str) =>
    Guarantees.fromJson(json.decode(str));

String guaranteesToJson(Guarantees data) => json.encode(data.toJson());

class Guarantees {
  int sponsor_id;
  String? orphan_id;
  String? payment_way;
  int? amount;
  int? id;
  var start_date;
  var end_date;
  String? alternative_name;
  String? alternative_phone;
  String? alternative_tele;
  String? alternative_address;
  // String? orderStatus;
  String? note;
  // String? approverId;

  Guarantees({
    required this.sponsor_id,
    this.orphan_id,
    this.note,
    this.id,
    this.payment_way,
    this.amount,
    this.start_date,
    this.end_date,
    this.alternative_name,
    this.alternative_phone,
    this.alternative_tele,
    this.alternative_address,
    // this.orderStatus,
    // this.approverId,
  });

  factory Guarantees.fromJson(Map<String, dynamic> json) => Guarantees(
        sponsor_id: json["sponser_id"],
        orphan_id: json["orphan_id"],
        payment_way: json["payment_way"],
        amount: json["amount"],
        note: json["note"],
        id: json["id"],
        start_date: json["start_date"],
        end_date: json["end_date"],
        alternative_name: json["alternative_name"],
        alternative_phone: json["alternative_phone"],
        alternative_tele: json["alternative_tele"],
        alternative_address: json["alternative_address"],
        // orderStatus: json["order_status"],
        // approverId: json["approver_id"],
      );

  Map<String, dynamic> toJson() => {
        "sponser_id": sponsor_id,
        "orphan_id": orphan_id,
        "payment_way": payment_way,
        "note": note,
        "id": id,
        "amount": amount,
        "start_date": start_date,
        "end_date": end_date,
        "alternative_name": alternative_name,
        "alternative_phone": alternative_phone,
        "alternative_tele": alternative_tele,
        "alternative_address": alternative_address,
        // "order_status": orderStatus,
        // "approver_id": approverId
      };
}
