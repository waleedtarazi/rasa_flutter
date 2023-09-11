import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rasa_flutter/constant/constant.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rasa_flutter/controller/user_profile_model.dart';

import '../main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is use for importance notifications',
    importance: Importance.defaultImportance);
    final _localNotification = FlutterLocalNotificationsPlugin();



  Future<void> handleMessage(RemoteMessage? message) async {
    print('\n---------\n Title: ${message?.notification?.title} \n ----------\n');
    if (message == null) return;
    if (message.notification?.title == 'chit-chat'){
          // navigate to other screen
          print('in chatbot screen');
    }
    if (message.notification?.title == 'Your Monthly analytics'){
      // navigate to the analytics screen
      print('\n+++++++++\n+++++++++\n in analytics screen \n+++++++\n+++++++++\n');
      // await MyApp.navigatorKey.currentState?.push(
      //   MaterialPageRoute(builder: (context) => ChatScreen()),
      // );
    }
  }


Future initLocalNotifications() async {
  const android = AndroidInitializationSettings('@drawable/rasa');
  const settings = InitializationSettings(android: android);

  await _localNotification.initialize(
    settings, 
    onSelectNotification: (payload) { 
      final message = RemoteMessage.fromMap(jsonDecode(payload!));
      handleMessage(message);
    }
  );

  final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  await platform?.createNotificationChannel(_androidChannel);

}

  Future initPushNotification() async {
    print('in the initPushNotification');

    await FirebaseMessaging.instance
    .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
      notification.hashCode, 
      notification.title, 
      notification.body, 
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id, 
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          // icon: '@drawable/rasa',
          )
      ),
      payload: jsonEncode(message.toMap()),
      );
    });
  }


  Future<String?> initNotification() async {
    final UserProfileModel userProfile = Get.put(UserProfileModel());
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('\n \n Token--> : $FCMToken\n \n');
    print("FCM from local storage:\n" + '$FCMToken' + "up\n");
    initPushNotification();
    initLocalNotifications();
    return FCMToken;
  }


}