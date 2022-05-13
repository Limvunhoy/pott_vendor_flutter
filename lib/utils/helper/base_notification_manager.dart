import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class BaseNotificationManager {
  static const AndroidNotificationChannel androidNotificationChannel =
      AndroidNotificationChannel(
    "high_importance_channel",
    "Notification Title",
    description: "Notification Description",
    importance: Importance.max,
    playSound: true,
  );

  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      try {
        if (payload != null && payload.isNotEmpty) {
          // TODO: Handle Payload Message
          Get.snackbar("Notification Payload", payload);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Failed to get notification payload: $e");
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      showMessage(remoteMessage, flutterLocalNotificationsPlugin);
    });
  }

  static void configLocationNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  static void showMessage(RemoteMessage message,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    if (message.notification != null) {
      RemoteNotification remoteNotification = message.notification!;

      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        channelDescription: androidNotificationChannel.description,
        color: colorExt.PRIMARY_COLOR,
        playSound: true,
      );

      flutterLocalNotificationsPlugin.show(
        remoteNotification.hashCode,
        remoteNotification.title,
        remoteNotification.body,
        NotificationDetails(android: androidNotificationDetails),
      );
    }
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage remoteMessage) async {
    await Firebase.initializeApp();
    debugPrint("Background Message: $remoteMessage");
    // showMessage(remoteMessage, flutterLocalNotificationsPlugin,
    //     "Background Notification");
    // if (remoteMessage.notification != null) {
    //   RemoteNotification remoteNotification = remoteMessage.notification!;
    //   showMessage(remoteMessage, flutterLocalNotificationsPlugin);
    // }
  }
}
