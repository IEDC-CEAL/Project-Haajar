import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_haajar/root.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User get user => _auth.currentUser;

  Rx<bool> isLoading = false.obs;

  Stream<User> userStream() => _auth.authStateChanges();

  void createUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.offAll(() => Root());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Creating User",
        e.message,
        borderColor: Colors.red,
        borderWidth: 1,
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        overlayBlur: 2,
        backgroundGradient:
            LinearGradient(colors: [Color(0xffCB356B), Color(0xffBD3F32)]),
        icon: Icon(
          Icons.warning_outlined,
          color: Colors.red,
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => Root());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Signing In",
        e.message,
        borderColor: Colors.red,
        borderWidth: 1,
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        overlayBlur: 2,
        backgroundGradient:
            LinearGradient(colors: [Color(0xffCB356B), Color(0xffBD3F32)]),
        icon: Icon(
          Icons.warning_outlined,
          color: Colors.red,
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Signing Out",
        e.message,
        borderColor: Colors.red,
        borderWidth: 1,
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        overlayBlur: 2,
        backgroundGradient:
            LinearGradient(colors: [Color(0xffCB356B), Color(0xffBD3F32)]),
        icon: Icon(
          Icons.warning_outlined,
          color: Colors.red,
        ),
      );
    }
  }
}
