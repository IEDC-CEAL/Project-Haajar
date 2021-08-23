import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';
import 'package:project_haajar/views/authentication_page/authentication_welcome_title.dart';
import 'package:project_haajar/views/authentication_page/sign_up_bar.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key, @required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;
  final deviceHeight = Get.size.height;
  final deviceWidth = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(Get.size.width * 0.07),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AuthenticationWelcomeTitle("Create\nAccount"),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Get.size.width * 0.025),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: registerInputDecoration(
                        hintText: "Enter Your Email",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Get.size.width * 0.025),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: registerInputDecoration(
                          hintText: "Enter your Password"),
                    ),
                  ),
                  SignUpBar(
                    isLoading: false,
                    label: "Sign Up",
                    onPressed: () {
                      print("Button Pressed");
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onSignInPressed?.call();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration registerInputDecoration({
    @required String hintText,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: deviceHeight * 0.028),
      hintStyle:
          TextStyle(color: Colors.white70, fontSize: deviceWidth * 0.043),
      hintText: hintText,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Palette.orange),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Palette.orange),
      ),
      errorStyle: const TextStyle(color: Colors.white),
    );
  }
}
