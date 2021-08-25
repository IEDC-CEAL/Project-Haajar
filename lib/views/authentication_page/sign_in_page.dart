import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:project_haajar/controllers/auth_controller.dart';

import 'package:project_haajar/controllers/sign_in_controller.dart';
import 'package:project_haajar/model/sign_in_page/form_scroll_behaviour_class.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';
import 'package:project_haajar/views/authentication_page/sign_in_bar.dart';
import 'authentication_welcome_title.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key key, @required this.onSignUpClicked}) : super(key: key);

  final VoidCallback onSignUpClicked;
  final deviceHeight = Get.size.height;
  final deviceWidth = Get.size.width;

  final signInController = Get.put(SignInController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: signInController.signInFormKey,
      child: Padding(
        padding: EdgeInsets.all(deviceWidth * 0.07),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AuthenticationWelcomeTitle("Welcome\nBack"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ScrollConfiguration(
                  behavior: FormScrollBehaviourClass(),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: deviceWidth * 0.01),
                        child: TextFormField(
                          controller: signInController.emailController,
                          onSaved: (email) {
                            signInController.email = email;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: signInInputDecoration(
                              hintText: "Enter your Email"),
                          textAlign: TextAlign.center,
                          validator: (email) =>
                              signInController.validateEmail(email),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: deviceWidth * 0.01),
                        child: TextFormField(
                          controller: signInController.passwordController,
                          onSaved: (password) {
                            signInController.password = password;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          decoration: signInInputDecoration(
                              hintText: "Enter your Password"),
                          validator: (password) {
                            return signInController.validatePassword(password);
                          },
                        ),
                      ),
                      SignInBar(
                        onPressed: () {
                          signInController.checkLogin();
                          print("Button Pressed");
                          authController.signIn(signInController.email,
                              signInController.password);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            onSignUpClicked?.call();
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                              fontSize: deviceHeight * 0.023,
                              decoration: TextDecoration.underline,
                              color: Palette.darkBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration signInInputDecoration({String hintText}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: deviceHeight * 0.028),
      hintStyle: TextStyle(
        color: Colors.black87,
        fontSize: Get.size.width * 0.043,
      ),
      hintText: hintText,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.red),
      ),
      errorStyle: const TextStyle(color: Colors.red),
    );
  }
}
