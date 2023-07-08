// To parse this JSON data, do
//
//     final guarantees = guaranteesFromJson(jsonString);

import 'dart:convert';

Guarantees guaranteesFromJson(String str) =>
    Guarantees.fromJson(json.decode(str));

String guaranteesToJson(Guarantees data) => json.encode(data.toJson());

class Guarantees {
  String? sponserId;
  String? orphanId;
  String? paymentWay;
  String? amount;
  String? startDate;
  String? endDate;
  String? alternativeName;
  String? alternativePhone;
  String? alternativeTele;
  String? alternativeAddress;
  String? orderStatus;
  String? approverId;

  Guarantees({
    this.sponserId,
    this.orphanId,
    this.paymentWay,
    this.amount,
    this.startDate,
    this.endDate,
    this.alternativeName,
    this.alternativePhone,
    this.alternativeTele,
    this.alternativeAddress,
    this.orderStatus,
    this.approverId,
  });

  factory Guarantees.fromJson(Map<String, dynamic> json) => Guarantees(
        sponserId: json["sponser_id"],
        orphanId: json["orphan_id"],
        paymentWay: json["payment_way"],
        amount: json["amount"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        alternativeName: json["alternative_name"],
        alternativePhone: json["alternative_phone"],
        alternativeTele: json["alternative_tele"],
        alternativeAddress: json["alternative_address"],
        orderStatus: json["order_status"],
        approverId: json["approver_id"],
      );

  Map<String, dynamic> toJson() => {
        "sponser_id": sponserId,
        "orphan_id": orphanId,
        "payment_way": paymentWay,
        "amount": amount,
        "start_date": startDate,
        "end_date": endDate,
        "alternative_name": alternativeName,
        "alternative_phone": alternativePhone,
        "alternative_tele": alternativeTele,
        "alternative_address": alternativeAddress,
        "order_status": orderStatus,
        "approver_id": approverId
      };
}
