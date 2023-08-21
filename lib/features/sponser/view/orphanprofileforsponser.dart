// // old
// import 'dart:convert';

// import 'package:alnamaa_charity/features/sponser/controller/sponser_home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:alnamaa_charity/utils/colors';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:get/get.dart';
// import 'package:alnamaa_charity/utils/app_constants.dart';
// import 'package:http/http.dart' as http;

// import '../../../utils/shared_pref/getstorage.dart';
// import '../../Profile/profile_model.dart';
// import '../../auth/signup/model/user_register_model.dart';

// class Orphanprof1ileForSponser extends StatefulWidget {
//   const Orphanprof1ileForSponser({
//     super.key,
//   });

//   @override
//   Orphanprof1ileForSponserState createState() =>
//       Orphanprof1ileForSponserState();
// }

// class Orphanprof1ileForSponserState extends State<Orphanprof1ileForSponser>
//     with SingleTickerProviderStateMixin {
//   UserModel user = GetStorageUtils().getUser();
//   // String orphan_id = GetStorageUtils().getorphanid();

//   late TabController _tabController;
//   final HomeController con = Get.put(HomeController());

//   // var _prof1 = ProfileModel();

//   // ProfileModel get prof1 => _prof1;
//   // Future getProfileList() async {
//   //   http.Response response = await http.get(
//   //       Uri.parse(
//   //           '${AppConstants.BASE_URL}/api/app/orphans/profile/${orphan_id.toString()}'),
//   //       headers: {
//   //         "Content-Type": "application/json",
//   //         "Accept": "application/json",
//   //         "Authorization": "Bearer ${user.token}"
//   //       });
//   //   var res = await jsonDecode(response.body);

//   //   if (response.statusCode == 200) {
//   //     setState(() {
//   //       _prof1 = ProfileModel.fromJson(res["data"]);
//   //       print(prof1.orphan!.firstName);
//   //     });
//   //   } else {}
//   // }

//   //late String imageUrl;
//   // final prof1ileModel userData = prof1ileModel.fromJson(json.decode(response.body).toString());

//   @override
//   void initState() {
//     super.initState();
//     // getProfileList();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return GetBuilder<HomeController>(builder: (controller) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: AppColors.whiteColor,
//         appBar: AppBar(
//           backgroundColor: AppColors.mainColor,
//           elevation: 0.0,
//           leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: AppColors.whiteColor,
//               ),
//               onPressed: () {
                  // Navigator.pop(context);
//               }
//               // =>
//               // Navigator.of(context).pop(),
//               ),
//           title: Align(
//             alignment: Alignment.center,
//             child: Text(
//               'الملف الشخصي',
//               style: TextStyle(
//                 color: AppColors.whiteColor,
//               ),
//             ),
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromRadius(133),
//             child: Column(
//               children: [
//                 ClipOval(
//                   child: CachedNetworkImage(
//                     imageUrl: AppConstants.BASE_URL + con.prof1.orphan!.photo!,
//                     placeholder: (context, url) => CircularProgressIndicator(),
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                     fit: BoxFit.fill,
//                     width: 133,
//                     height: 133,
//                   ),
//                 ),

//                 Align(
//                   child: Text(
//                       "${con.prof1.orphan?.firstName!} ${con.prof1.orphan?.lastName!}",
//                       style: const TextStyle(
//                           color: Color.fromRGBO(50, 50, 93, 1),
//                           fontSize: 26.0)),
//                 ),
//                 const SizedBox(height: 10.0),

//                 const Divider(
//                   height: 40.0,
//                   thickness: 1.5,
//                   indent: 32.0,
//                   endIndent: 32.0,
//                 ),

//                 TabBar(
//                   controller: _tabController,
//                   tabs: const [
//                     Tab(text: 'About'),
//                     Tab(text: 'Achievements'),
//                   ],
//                 ),
//                 // prof1ile photo
//               ],
//             ),
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             ListView(
//               children: [
//                 ListTile(
//                   leading: Icon(
//                     Icons.date_range_outlined,
//                     color: AppColors.iconColor1,
//                   ),
//                   title: Text("Birth"),
//                   subtitle: Text("${con.prof1.orphan!.birth!}"),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.school_outlined,
//                     color: AppColors.iconColor2,
//                   ),
//                   title: Text('Study & Scool'),
//                   subtitle: Text(
//                       "${con.prof1.orphan!.study!} - ${con.prof1.orphan!.schoolName!} school "),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.numbers_outlined,
//                     color: AppColors.mainBlackColor,
//                   ),
//                   title: Text('National Number'),
//                   subtitle: Text("${con.prof1.orphan!.nationalNumber!} "),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.location_city_outlined,
//                     color: AppColors.greyColor,
//                   ),
//                   title: Text('Adress'),
//                   subtitle: Text(
//                       "${con.prof1.address!.country!} - ${con.prof1.address!.state!} - ${con.prof1.address!.city!}- ${con.prof1.address!.street!} "),
//                 ),
//                 SizedBox(
//                   height: 200, // Set a fixed height here
//                   child: ListView.builder(
//                     itemCount: con.prof1.receipt?.length ?? 0,
//                     itemBuilder: (BuildContext context, int index) {
//                       var rec_amount = con.prof1.receipt?[index];
//                       return ListTile(
//                         leading: Icon(
//                           Icons.timer_outlined,
//                           color: AppColors.iconColor1,
//                         ),
//                         title: Text(
//                           'my receipts',
//                         ),
//                         subtitle: Text(
//                             '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]'),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             ListView.builder(
//               itemCount: con.prof1.achievements?.length ?? 0,
//               itemBuilder: (BuildContext context, int index) {
//                 var achievement = con.prof1.achievements?[index];
//                 return Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.all(33),
//                       padding: EdgeInsets.all(8.0),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             AppColors.mainColor,
//                             AppColors.containerColor,
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(8.0),
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 7,
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 7,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         leading: Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         title: Text(
//                           "${achievement?.title ?? ''}    2023-08-09T07:18:57.000000Z",
//                           style: TextStyle(
//                             color: AppColors.whiteColor,
//                           ),
//                         ),
//                         subtitle: Text(
//                           "${achievement?.createdAt ?? ''}-${achievement?.body ?? ''}",
//                           style: TextStyle(
//                             color: AppColors.mainColor,
//                           ),
//                         ),

//                         //trailing: Text("${achievement?.createdAt ?? ''}-${achievement?.body ?? ''}"),
//                       ),
//                     ),
//                     Container(
//                       width: 333,
//                       height: 333,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                               "assets/images/photo_2023-08-10_00-35-19.jpg"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   // );
//   // );
// }
