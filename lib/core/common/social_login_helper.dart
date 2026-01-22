import 'package:flutter/cupertino.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'apputills.dart';

class SocialLoginHelper {
  static Future<AuthorizationCredentialAppleID?> loginWithApple() async {
    try {
      Utils.showLoading();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      Utils.hideLoading();
      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      return appleCredential;
    } catch (e) {
      Utils.hideLoading();
      debugPrint("apple error $e");
      return null;
    }
  }

  // static Future<UserCredential?> loginWithGoogle() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  //   try {
  //     Utils.showLoading();
  //     if (await googleSignIn.isSignedIn()) {
  //       await googleSignIn.signOut();
  //     }
  //     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //
  //     GoogleSignInAuthentication? googleSignInAuthentication =
  //     await googleUser?.authentication;
  //
  //     AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication?.accessToken,
  //       idToken: googleSignInAuthentication?.idToken,
  //     );
  //     if (googleUser == null) {
  //       Utils.hideLoading();
  //       // User canceled the sign-in process.
  //       return null;
  //     }
  //     debugPrint('User ID: ${googleUser.id}');
  //     debugPrint('Display Name: ${googleUser.displayName}');
  //     debugPrint('Email: ${googleUser.email}');
  //     debugPrint('ID Token: ${credential.token}');
  //     debugPrint('Access Token: ${credential.accessToken}');
  //     Utils.hideLoading();
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     Utils.hideLoading();
  //     debugPrint('Error during Google Sign-In: $e');
  //     return null;
  //   }
  // }

// static Future<UserCredential?> loginWithFacebook() async {
//
//   try {
//     Utils.showLoading();
//     final LoginResult result = await FacebookAuth.instance.login(
//       permissions: ['public_profile', 'email'],
//     );
//
//     if (result.status == LoginStatus.success) {
//       final AccessToken accessToken = result.accessToken!;
//       debugPrint('Token: ${accessToken.tokenString}');
//       debugPrint('userId: ${accessToken.tokenString}');
//       final OAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(accessToken.tokenString);
//       Utils.hideLoading();
//       return await FirebaseAuth.instance
//           .signInWithCredential(facebookAuthCredential);
//     } else {
//       Utils.hideLoading();
//       // Handle other status cases (e.g., error, canceled).
//       debugPrint('Error during Facebook Sign-In: ${result.status}');
//       return null;
//     }
//   } catch (e) {
//     debugPrint('Error during Facebook Sign-In: $e');
//     return null;
//   }
// }

}