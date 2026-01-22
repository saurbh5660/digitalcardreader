import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

import 'core/common/db_helper.dart';
import 'core/constants/app_routes.dart';
import 'notification/notification_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final isLoggedIn = DbHelper().getIsLoggedIn();

      Logger().d(isLoggedIn);
      if (!isLoggedIn) {
        Get.offAllNamed(AppRoutes.onboarding);
        return;
      }
      bool handled = await NotificationService().checkInitialMessage();
      if (!handled) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center(
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 30),
          //     child: Image.asset(
          //       Assets.imagesAppLogo,
          //       height: 150,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
