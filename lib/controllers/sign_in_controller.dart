import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  TextEditingController emailController, passwordController;
  var email = "";
  var password = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Provide a valid email";
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final bool isValid = signInFormKey.currentState.validate();
    if (!isValid) {
      return;
    }
    signInFormKey.currentState.save();
  }
}
