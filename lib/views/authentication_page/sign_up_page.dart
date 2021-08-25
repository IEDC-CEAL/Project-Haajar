import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_haajar/controllers/auth_controller.dart';
import 'package:project_haajar/controllers/sign_up_controller.dart';
import 'package:project_haajar/model/sign_in_page/form_scroll_behaviour_class.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';
import 'package:project_haajar/views/authentication_page/authentication_welcome_title.dart';
import 'package:project_haajar/views/authentication_page/sign_up_bar.dart';
import 'package:get/get_instance/get_instance.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key, @required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;
  final deviceHeight = Get.size.height;
  final deviceWidth = Get.size.width;

  final SignUpController _signUpController = Get.put(SignUpController());
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpController.signUpFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
              flex: 6,
              child: ScrollConfiguration(
                behavior: FormScrollBehaviourClass(),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Get.size.width * 0.01),
                      child: TextFormField(
                        controller: _signUpController.emailController,
                        onSaved: (email) {
                          _signUpController.email = email;
                        },
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: registerInputDecoration(
                          hintText: "Enter Your Email",
                        ),
                        validator: (email) =>
                            _signUpController.validateEmail(email),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Get.size.width * 0.01),
                      child: TextFormField(
                        controller: _signUpController.passwordController,
                        onSaved: (password) {
                          _signUpController.password = password;
                        },
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: registerInputDecoration(
                            hintText: "Enter your Password"),
                        validator: (password) =>
                            _signUpController.validatePassword(password),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Get.size.width * 0.01),
                      child: TextFormField(
                        controller: _signUpController.confirmPasswordController,
                        onSaved: (confirmPassword) {
                          _signUpController.confirmPassword = confirmPassword;
                        },
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: registerInputDecoration(
                            hintText: "Confirm your Password"),
                        validator: (confirmPassword) =>
                            _signUpController.validateConfirmPassword(
                                password:
                                    _signUpController.passwordController.text,
                                confirmPassword: confirmPassword),
                      ),
                    ),
                    SignUpBar(
                      onPressed: () {
                        _signUpController.checkLogin();
                        print("Button Pressed");
                        if ((_signUpController.password ==
                                _signUpController.confirmPassword) &&
                            _signUpController.password.length >= 6) {
                          _authController.createUser(_signUpController.email,
                              _signUpController.confirmPassword);
                        }
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
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red[900]),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.red[900]),
      ),
      errorStyle: TextStyle(color: Colors.red[900]),
    );
  }
}
