// import 'package:firebase_messaging/firebase_messaging.dart';

// class NotificationService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future initialize() async {
//     await requestPermission();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received notification: ${message.notification?.title}');
//     });
//   }

//   Future requestPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//   }
// }
