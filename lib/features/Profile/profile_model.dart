import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  Orphan? orphan;
  Address? address;
  List<Achievement>? achievements;
  List<Receipt>? receipt;

  ProfileModel({
    this.orphan,
    this.address,
    this.achievements,
    this.receipt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        orphan: Orphan.fromJson(json["orphan"]),
        address: Address.fromJson(json["address"]),
        achievements: List<Achievement>.from(
            json["achievements"].map((x) => Achievement.fromJson(x))),
        receipt:
            List<Receipt>.from(json["receipt"].map((x) => Receipt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orphan": orphan!.toJson(),
        "address": address!.toJson(),
        "achievements":
            List<dynamic>.from(achievements!.map((x) => x.toJson())),
        "receipt": List<dynamic>.from(receipt!.map((x) => x.toJson())),
      };
}

class Achievement {
  var id;
  var orId;
  var title;
  var body;
  var createdAt;
  var updatedAt;

  Achievement(
      {this.id,
      this.orId,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt});

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json["id "].toString(),
        orId: json["or_id"].toString(),
        title: json["title"],
        body: json["body"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id ": id.toString(),
        "or_id": orId.toString(),
        "title": title,
        "body": body,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
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
        id: json["id"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "state": state,
        "city": city,
        "street": street,
      };
}

class Orphan {
  var id;
  var mCardId;
  String? firstName;
  String? lastName;
  String? birth;
  String? study;
  var schoolName;
  var photo;
  var healthStatus;
  var nationalNumber;
  var affiliationDate;
  var status;
  var deletedAt;
  var createdAt;
  var updatedAt;
  var age;

  Orphan({
    this.id,
    this.mCardId,
    this.firstName,
    this.lastName,
    this.birth,
    this.study,
    this.schoolName,
    this.photo,
    this.healthStatus,
    this.nationalNumber,
    this.affiliationDate,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.age,
  });

  factory Orphan.fromJson(Map<String, dynamic> json) => Orphan(
        id: json["id"],
        mCardId: json["m_card_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birth: json["birth"],
        study: json["study"],
        schoolName: json["school_name"],
        photo: json["photo"],
        healthStatus: json["health_status"],
        nationalNumber: json["national_number"],
        affiliationDate: json["affiliation_date"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        age: json["age"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_card_id": mCardId,
        "first_name": firstName,
        "last_name": lastName,
        "birth": birth,
        "study": study,
        "school_name": schoolName,
        "photo": photo,
        "health_status": healthStatus,
        "national_number": nationalNumber,
        "affiliation_date": affiliationDate,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "age": age,
      };
}

class Receipt {
  var id;
  var amount;
  var fromDate;
  var toDate;

  Receipt({
    this.id,
    this.amount,
    this.fromDate,
    this.toDate,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
        id: json["id "],
        amount: json["amount"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
      );

  Map<String, dynamic> toJson() => {
        "id ": id,
        "amount": amount,
        "from_date": fromDate,
        "to_date": toDate,
      };
}







//old model
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ProfileModel {
//   bool? _success;
//   Data? _data;
//   String? _message;

//   ProfileModel({required success, required data, required message}) {
//     this._success = success;
//     this._data = data;
//     this._message = message;
//   }

//   ProfileModel.fromJson(Map<String, dynamic> json) {
//     _success = json['success'];
//     _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     _message = json['message'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['success'] = this._success;
//   //   if (this._data != null) {
//   //     data['data'] = this._data!.toJson();
//   //   }
//   //   data['message'] = this._message;
//   //   return data;
//   // }
// }

// class Data {
//   Orphan? _orphan;
//   Address? _address;
//   //List<Data>? _achievements;
//   late List<dynamic> _achievements;
//   List<dynamic> get achievements => _achievements;
//   //List<Data>? _receipt;
//   late List<dynamic> _receipt;
//   List<dynamic> get receipt => _receipt;

//   Data(
//       {required orphan,
//       required address,
//       required achievements,
//       required receipt}) {
//     this._orphan = orphan;
//     this._address = address;
//     this._achievements = achievements;
//     this._receipt = receipt;
//   }

//   Data.fromJson(Map<String, dynamic> json) {
//     _orphan =
//         json['orphan'] != null ? new Orphan.fromJson(json['orphan']) : null;
//     _address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     if (json['achievements'] != null) {
//       _achievements = <Achievements>[];
//       json['achievements'].forEach((v) {
//         _achievements!.add(Achievements.fromJson(v));
//       });
//     }
//     if (json['receipt'] != null) {
//       _receipt = <Receipt>[];
//       json['receipt'].forEach((v) {
//         _receipt!.add(Receipt.fromJson(v));
//       });
//     }
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   if (this._orphan != null) {
//   //     data['orphan'] = this._orphan!.toJson();
//   //   }
//   //   if (this._address != null) {
//   //     data['address'] = this._address!.toJson();
//   //   }
//   //   if (this._achievements != null) {
//   //     data['achievements'] =
//   //         this._achievements!.map((v) => v.toJson()).toList();
//   //   }
//   //   if (this._receipt != null) {
//   //     data['receipt'] = this._receipt!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }

// class Orphan {
//   int? _id;
//   int? _mCardId;
//   String? _firstName;
//   String? _lastName;
//   String? _birth;
//   String? _study;
//   String? _schoolName;
//   String? _photo;
//   String? _healthStatus;
//   String? _nationalNumber;
//   String? _affiliationDate;
//   String? _status;
//   Null? _deletedAt;
//   String? _createdAt;
//   String? _updatedAt;
//   int? _age;

//   Orphan(
//       {required id,
//       required mCardId,
//       required firstName,
//       required lastName,
//       required birth,
//       required study,
//       required schoolName,
//       required photo,
//       required healthStatus,
//       required nationalNumber,
//       required affiliationDate,
//       required status,
//       required deletedAt,
//       required createdAt,
//       required updatedAt,
//       required age}) {
//     this._id = id;
//     this._mCardId = mCardId;
//     this._firstName = firstName;
//     this._lastName = lastName;
//     this._birth = birth;
//     this._study = study;
//     this._schoolName = schoolName;
//     this._photo = photo;
//     this._healthStatus = healthStatus;
//     this._nationalNumber = nationalNumber;
//     this._affiliationDate = affiliationDate;
//     this._status = status;
//     this._deletedAt = deletedAt;
//     this._createdAt = createdAt;
//     this._updatedAt = updatedAt;
//     this._age = age;
//   }

//   Orphan.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _mCardId = json['m_card_id'];
//     _firstName = json['first_name'];
//     _lastName = json['last_name'];
//     _birth = json['birth'];
//     _study = json['study'];
//     _schoolName = json['school_name'];
//     _photo = json['photo'];
//     _healthStatus = json['health_status'];
//     _nationalNumber = json['national_number'];
//     _affiliationDate = json['affiliation_date'];
//     _status = json['status'];
//     _deletedAt = json['deleted_at'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _age = json['age'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this._id;
//   //   data['m_card_id'] = this._mCardId;
//   //   data['first_name'] = this._firstName;
//   //   data['last_name'] = this._lastName;
//   //   data['birth'] = this._birth;
//   //   data['study'] = this._study;
//   //   data['school_name'] = this._schoolName;
//   //   data['photo'] = this._photo;
//   //   data['health_status'] = this._healthStatus;
//   //   data['national_number'] = this._nationalNumber;
//   //   data['affiliation_date'] = this._affiliationDate;
//   //   data['status'] = this._status;
//   //   data['deleted_at'] = this._deletedAt;
//   //   data['created_at'] = this._createdAt;
//   //   data['updated_at'] = this._updatedAt;
//   //   data['age'] = this._age;
//   //   return data;
//   // }
// }

// class Address {
//   int? _id;
//   String? _country;
//   String? _state;
//   String? _city;
//   String? _street;

//   Address(
//       {required id,
//       required country,
//       required state,
//       required city,
//       required street}) {
//     this._country = country;
//     this._city = city;
//     this._state = state;
//     this._street = street;
//     this._id = id;
//   }

//   Address.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _country = json['country'];
//     _state = json['state'];
//     _city = json['city'];
//     _street = json['street'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this._id;
//   //   data['country'] = this._country;
//   //   data['state'] = this._state;
//   //   data['city'] = this._city;
//   //   data['street'] = this._street;
//   //   return data;
//   // }
// }

// class Achievements {
//   int? _id;
//   int? _or_id;
//   String? _title;
//   String? _body;
//   String? _createdAt;
//   String? _updatedAt;

//   Achievements(
//       {required id,
//       required or_id,
//       required title,
//       required body,
//       required createdAt,
//       required updatedAt}) {
//     this._title = title;
//     this._createdAt = createdAt;
//     this._body = body;
//     this._updatedAt = updatedAt;
//     this._id = id;
//     this._or_id = or_id;
//   }

//   Achievements.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _or_id = json['orphan_id'];
//     _title = json['title'];
//     _body = json['body'];
//     _createdAt = json['createdAt'];
//     _updatedAt = json['updatedAt'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this._id;
//   //   data['country'] = this._country;
//   //   data['state'] = this._state;
//   //   data['city'] = this._city;
//   //   data['street'] = this._street;
//   //   return data;
//   // }
// }

// class Receipt {
//   int? _id;
//   int? _amount;
//   String? _from_date;
//   String? _to_date;

//   Receipt({
//     required id,
//     required amount,
//     required from_date,
//     required to_date,
//   }) {
//     this._from_date = from_date;

//     this._to_date = to_date;
//     this._amount = amount;
//     this._id = id;
//   }

//   Receipt.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _amount = json['amount'];
//     _from_date = json['from_date'];
//     _to_date = json['to_date'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this._id;
//   //   data['country'] = this._country;
//   //   data['state'] = this._state;
//   //   data['city'] = this._city;
//   //   data['street'] = this._street;
//   //   return data;
//   // }
// }
