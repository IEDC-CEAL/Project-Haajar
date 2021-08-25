import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:project_haajar/controllers/auth_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_haajar/model/sign_in_page/palette.dart';

class SignInBar extends StatelessWidget {
  SignInBar({this.onPressed});

  final VoidCallback onPressed;

  final deviceHeight = Get.size.height;
  final deviceWidth = Get.size.width;

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.05),
      child: Row(
        children: <Widget>[
          Text("Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: deviceWidth * 0.07,
                color: Palette.darkBlue,
              )),
          Expanded(
            child: Center(
              child: _loadingIndicator(),
            ),
          ),
          _roundContinueButton(onPressed: onPressed),
        ],
      ),
    );
  }

  Widget _loadingIndicator() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 100,
      ),
      child: Obx(() => Visibility(
            visible: authController.isLoading.value,
            child: const LinearProgressIndicator(
              backgroundColor: Palette.darkBlue,
            ),
          )),
    );
  }

  Widget _roundContinueButton({VoidCallback onPressed}) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Palette.darkBlue,
      splashColor: Palette.darkOrange,
      padding: EdgeInsets.all(22.0),
      shape: const CircleBorder(),
      child: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white70,
        size: deviceHeight * 0.035,
      ),
    );
  }
}
