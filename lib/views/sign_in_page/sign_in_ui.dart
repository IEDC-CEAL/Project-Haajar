import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';
import 'package:project_haajar/views/sign_in_page/sign_in_title.dart';
import 'package:project_haajar/views/sign_in_page/sign_in_bar.dart';

import 'form_textfield_input_decorations.dart';

class SignInUI extends StatelessWidget {
  const SignInUI({Key key, @required this.onRegisterClicked}) : super(key: key);

  final VoidCallback onRegisterClicked;

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
                child: SignInTitle("Welcome\nBack"),
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
                      decoration: signInInputDecoration(hintText: "Email"),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Get.size.width * 0.025),
                    child: TextFormField(
                      decoration: signInInputDecoration(hintText: "Password"),
                    ),
                  ),
                  SignInBar(
                    isLoading: false,
                    label: "Sign In",
                    onPressed: () {
                      print("Button Pressed");
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onRegisterClicked?.call();
                      },
                      child: const Text(
                        "Sign up",
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
}
