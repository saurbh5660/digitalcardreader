import 'package:device_preview/device_preview.dart';
import 'package:digital_card_grader/core/configs/app_pages.dart';
import 'package:digital_card_grader/core/configs/app_themes.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.7),
      overlayWidgetBuilder: (_) {
        return Center(
            child: CircularProgressIndicator(
              color: AppColors.black,
            ));
      },
      child: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Digital Card Grader',
          theme: AppThemes.custom,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.all,
        ),
      ),
    );
  }
  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
