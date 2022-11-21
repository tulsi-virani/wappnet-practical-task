import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Services/routes.dart';
import '../../constants/color_config.dart';

class AuthController extends GetxController {
  static Future<User?> signInWithGoogle(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    await logout();
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) throw FirebaseException;
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    CircularProgressIndicator(
      color: ColorsConfig.blackColor,
    );
    final user = await _signInWithCredential(authCredential);
    if (user != null) {
      Get.toNamed(AppRoute.categories);
    }
    return user;
  }

  static Future<User?> _signInWithCredential(
    AuthCredential authCredential,
  ) async {
    await logout();
    final user = await FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .catchError((error) {
      throw FirebaseException;
    });
    return user.user;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
