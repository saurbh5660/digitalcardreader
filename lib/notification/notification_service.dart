import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../core/common/db_helper.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_routes.dart';
import '../firebase_options.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();
  factory NotificationService() => _notificationService;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
  );

  Future<void> init() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          Map<String, dynamic> data = jsonDecode(response.payload!);
          handleNavigation(data);
        }
      },
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Only run UI/Listener logic if not in a background isolate
    if (!GetPlatform.isWeb) {
      _requestFullPermissions();
      initFirebaseListeners();
    }
  }

  Future<void> _requestFullPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(alert: true, badge: true, sound: true);

    if (GetPlatform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // --- CRITICAL FOR SPLASH SCREEN ---
  Future<bool> checkInitialMessage() async {
    // 1. Check if app was opened via Firebase (Notification Payload)
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleNavigation(initialMessage.data, isColdStart: true);
      return true;
    }

    // 2. Check if app was opened via Local Notification (Data-only Payload)
    final NotificationAppLaunchDetails? details =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      String? payload = details!.notificationResponse?.payload;
      if (payload != null) {
        Map<String, dynamic> data = jsonDecode(payload);
        handleNavigation(data, isColdStart: true);
        return true;
      }
    }
    return false;
  }

  void initFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("Foreground Data Received: ${message.data}");
      if (Get.currentRoute == AppRoutes.chat &&
          message.data['type'] == "1") {
        debugPrint("Chat open → suppress notification");
        return;
      }
      if (DbHelper().getUserToken() != null) {
        showNotifications(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("Notification Tapped (Background): ${message.data}");
      handleNavigation(message.data);
    });
  }

  Future<void> showNotifications(RemoteMessage message) async {
    int id = Random().nextInt(900) + 10;
    String payloadData = jsonEncode(message.data);
    String title = "OcYM Global";
    String body = message.data['message'] ?? "New Notification";

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: "@mipmap/ic_launcher",
          color: AppColors.green,
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(body),
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payloadData,
    );
  }

  void handleNavigation(Map<String, dynamic> data, {bool isColdStart = false}) async {
    debugPrint("Navigating with Map Data: $data");
    String type = data['type']?.toString() ?? "";

    if (type == "1") {
      var args = {
        'receiverId': data['senderId'] ?? "",
      };
      if(isColdStart){
        Get.offAllNamed(AppRoutes.chat, arguments: args);
      }else{
        Get.toNamed(AppRoutes.chat, arguments: args);
      }
    }
   else {
     /* if(isColdStart){
        Get.offAllNamed(AppRoutes.notificationScreen);
      }else{
        Get.toNamed(AppRoutes.notificationScreen);

      }*/
    }
  }
}