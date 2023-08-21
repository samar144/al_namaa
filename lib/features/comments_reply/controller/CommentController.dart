import 'package:alnamaa_charity/features/advertisements/model/advertisement_model.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/app_constants.dart';
import '../../../utils/baseurl.dart';

import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../model/comment_model.dart';

class CommentController extends GetxController {
  late TextEditingController commenteditcontroller;
  // var comments = <Commentmodel>[].obs;
  UserModel user = GetStorageUtils().getUser();

  @override
  void onInit() {
    commenteditcontroller = TextEditingController();
    // fetchComments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<List<Commentmodel>> fetchData(var advertisementId) async {
  //   var response = await http
  //       .get(Uri.parse('$baseUrl/api/comments/$advertisementId'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${user.token}"
  //   });
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body) as List<dynamic>;

  //     // Parse the response data into instances of the Comment model class
  //     final List<Commentmodel> comments = jsonData.map((data) {
  //       return Commentmodel.fromJson(data);
  //     }).toList();

  //     return comments;
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

  // Commentmodel createComment(Map<String, dynamic> json) {
  //   return Commentmodel(
  //     id: json["id"],
  //     advertisementId: json["advertisement_id"],
  //     userId: json["user_id"],
  //     body: json["body"],
  //     createdAt: json["created_at"] == null
  //         ? null
  //         : DateTime.parse(json["created_at"]),
  //     updatedAt: json["updated_at"] == null
  //         ? null
  //         : DateTime.parse(json["updated_at"]),
  //     user: User(
  //       id: json["id"],
  //       first_name: json["first_name"],
  //       lastName: json["last_name"],
  //       address: json["address"],
  //     ),
  //   );
  // }
  final RxList _comment = [].obs;
  // List<Commentmodel> _comment = [].obs;

  List get comment => _comment;
  Future<void> fetchComments(var advertisementId) async {
    // Fetch comments for the given advertisementId from API or database
    // Add fetched comments to the list using comments.add()
    var response = await http
        .get(Uri.parse('$baseUrl/api/comments/$advertisementId'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);
    var dataa = (res["data"]);

    if (response.statusCode == 200) {
      // var dataa = Commentmodel.fromJson(res["data"]);
      // final List data = [];
      _comment.clear();

      for (var item in dataa) {
        final comment1 = Commentmodel.fromJson(item);
        // print(comment1.runtimeType);
        _comment.add(comment1);
      }
      // _comment.value = data;

      // var jsonResponse = jsonDecode(response.body);
      // List<Commentmodel> comments = List<Commentmodel>.from(
      //     jsonResponse["data"].map((x) => Commentmodel.fromJson(x)));

      // _comment.assignAll(comments);
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  // Future<void> addComment(
  //     {required var advertisementId,
  //     required var userId,
  //     required var body,var user}) async {
  //   var response = await http.post(Uri.parse('$baseUrl/api/comments'),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         "Authorization": "Bearer ${user.token}"
  //       },
  //       body: jsonEncode({
  //         "advertisement_id": advertisementId,
  //         "user_id": userId,
  //         "body": body,
  //         "user":User(first_name: first_name, lastName: lastName)
  //       }));

  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body);

  //     final comment = Commentmodel.fromJson(jsonResponse['data']);
  //     _comment.add(comment);
  //   } else {
  //     throw Exception('Failed to add comment');
  //   }
  // }

  // RxList _comment = RxList<Commentmodel>([]);
  // List<Commentmodel> get comment => _comment.toJson();

  // Future<void> fetchComments() async {
  //   var response =
  //       await http.get(Uri.parse('$baseUrl/api/comments/24'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${user.token}"
  //   });

  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     List<Commentmodel> comments = List<Commentmodel>.from(
  //         jsonResponse["data"].map((x) => Commentmodel.fromJson(x)));

  //     _comment.assignAll(comments);
  //   } else {
  //     throw Exception("Failed to fetch data");
  //   }
  // }

//   // void addComment(Commentmodel comment) {

//   //   comments.add(comment);
//   // }
// ///////////////////////////////////////////////////////////////////////
  Future<void> addComment(Commentmodel comment) async {
    var url = Uri.parse('$baseUrl/api/comments');
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    };
    var body = jsonEncode(comment);

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // var newComment = jsonResponse["data"];
      // final comment1 = (comment);

      _comment.add(comment);
    } else {
      throw Exception("Failed to add comment");
    }
  }

//   /////////////////////////////////////////////////////////////////////////////
//   // Future<void> addComment(Commentmodel comm) async {
//   //   var response = await http.post(
//   //       Uri.parse('${AppConstants.BASE_URL}/api/comments'),
//   //       body: jsonEncode(comm),
//   //       headers: {
//   //         "Content-Type": "application/json",
//   //         "Accept": "application/json",
//   //         "Authorization": "Bearer ${user.token}"
//   //       });
//   //   var res = await jsonDecode(response.body);
//   //   if (response.statusCode == 200) {
//   //     _comment.add(comm);
//   //     commenteditcontroller.clear();
//   //     customsnackbar("", res["message"], "success");
//   //   } else {}
//   // }

//   void updateComment(int index, Commentmodel updatedComment) {
//     // comments[index] = updatedComment;
//   }

//   void deleteComment(int index) {
//     // comments.removeAt(index);
//   }
}
