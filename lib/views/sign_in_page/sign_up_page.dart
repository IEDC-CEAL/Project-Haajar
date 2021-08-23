import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';
import 'package:project_haajar/views/sign_in_page/sign_in_title.dart';
import 'package:project_haajar/views/sign_in_page/sign_up_bar.dart';

import 'form_textfield_input_decorations.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key, @required this.onSignInPressed})
      : super(key: key);

  final VoidCallback onSignInPressed;

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
                child: SignInTitle("Create\nAccount"),
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
                      decoration: registerInputDecoration(
                        hintText: "Email",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Get.size.width * 0.025),
                    child: TextFormField(
                      decoration: registerInputDecoration(hintText: "Password"),
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
}
