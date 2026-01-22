import 'dart:io';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../common/social_login_helper.dart';
import '../../../constants/app_strings.dart';

class SigninController extends GetxController {
  final singinFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = RxBool(true);
  var deviceToken = "";

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String webClientId =
      "333408157853-m0cfu4ev4tiv11k43qaj4ng724rplv05.apps.googleusercontent.com";

  Future<void> login() async {
    if (emailController.text.trim().isEmpty) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterEmail);
      return;
    }
    if (!emailController.text.trim().isEmail) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterValidEmail);
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterPassword);
      return;
    }

    String deviceToken = await FirebaseMessaging.instance.getToken() ?? "";


    Map<String, dynamic> userData = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "deviceToken": deviceToken,
      "deviceType": Platform.isAndroid ? "1" : "2",
    };

    var response = await ApiProvider().loginApi(userData);
    if (response.success == true) {
      DbHelper().saveIsLoggedIn(true);
      DbHelper().saveUserModel(response.body);
      DbHelper().saveUserToken(response.body?.token ?? "");
      Get.toNamed(AppRoutes.dashboard);
    } else {
      Utils.showToast(message: response.message ?? "Login failed");
    }
  }


  Future<void> signInWithGoogle() async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: Colors.black)),
        barrierDismissible: false,
      );

      // 1. Pass the Web Client ID as the serverClientId
      await _googleSignIn.initialize(serverClientId: webClientId);

      // 2. Trigger the account selection picker
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();

      if (googleUser == null) {
        Get.back();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // 3. Create a Firebase Credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      Get.back();
      User? firebaseUser = userCredential.user;
      if (userCredential.user != null) {
        socialLogin(
          "1",
          firebaseUser?.uid ?? "",
          firebaseUser?.email ?? "",
          firebaseUser?.displayName ?? "",
        );
      }
    } catch (e) {
      Get.back();
      // Use the error handling logic from the official example you found
      if (e is GoogleSignInException) {
        Logger().e("Google Error Code: ${e.code}");
        Utils.showErrorToast(message: "Google Configuration Error: ${e.code}");
      } else {
        Logger().e("General Error: $e");
        Utils.showErrorToast(message: "Login failed. Please try again.");
      }
    }
  }

  Future<void> socialLogin(
      String socialType,
      String socialId,
      String email,
      String name,
      ) async {
    String deviceToken = await FirebaseMessaging.instance.getToken() ?? "";

    Map<String, dynamic> userData = {
      "fullName": name,
      "socialType": socialType,
      "socialId": socialId,
      "email": email,
      "deviceToken": deviceToken,
      "deviceType": Platform.isAndroid ? "1" : "2",
    };

   /* var response = await ApiProvider().socialLogin(userData);
    if (response.success == true) {
      DbHelper().saveIsLoggedIn(true);
      DbHelper().saveUserModel(response.body);
      DbHelper().saveUserToken(response.body?.token ?? "");
      Get.toNamed(AppRoutes.dashboard);
    } else {
      Utils.showErrorToast(message: response.message ?? "");
    }*/
  }

  Future<void> signInWithApple() async {
    var user = await SocialLoginHelper.loginWithApple();
    if (user != null) {
      String appleEmail = user.email ?? "";
      String appleName = "${user.givenName ?? ""} ${user.familyName ?? ""}";
      String appleId = user.userIdentifier ?? "";
      Logger().d(appleName);
      Logger().d(appleEmail);
      Logger().d(appleId);
      socialLogin("2", appleId, appleEmail, appleName);
    }
  }
}
