import 'package:flutter/cupertino.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  var email = "";
  var password = "";
  var confirmPassword = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    confirmPasswordController.dispose();
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

  String validateConfirmPassword({String password, String confirmPassword}) {
    if (confirmPassword != password) {
      return "Passwords not matching";
    }
    return null;
  }

  void checkLogin() {
    final bool isValid = signUpFormKey.currentState.validate();
    if (!isValid) {
      return;
    }
    signUpFormKey.currentState.save();
  }
}
