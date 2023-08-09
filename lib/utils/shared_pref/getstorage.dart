import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import '../../features/auth/signup/model/user_register_model.dart';

class GetStorageUtils {
  static final _storage = GetStorage();

  void saveUser(UserModel userModel) {
    _storage.write('userModel', userModelToJson(userModel));
  }

  UserModel getUser() {
    String userModelJson = _storage.read('userModel');
    // if (userModelJson != null) {
    return userModelFromJson(userModelJson);
    // }
    // return null;
  }

  void removeUser() {
    _storage.remove('userModel');
  }

  String userModelToJson(UserModel data) {
    return '{"name": "${data.name}", "email": "${data.email}","user_id":${data.user_id},"token":"${data.token}"}';
  }

  UserModel userModelFromJson(String str) {
    final Map<String, dynamic> json = jsonDecode(str);
    return UserModel(
        name: json['name'],
        email: json['email'],
        user_id: json["user_id"],
        token: json["token"]);
  }
}
