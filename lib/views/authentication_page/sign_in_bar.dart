import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:project_haajar/model/sign_in_page/palette.dart';

class SignInBar extends StatelessWidget {
  SignInBar({this.label, this.onPressed, this.isLoading});

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  final deviceHeight = Get.size.height;
  final deviceWidth = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.05),
      child: Row(
        children: <Widget>[
          Text(label,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: deviceWidth * 0.07,
                color: Palette.darkBlue,
              )),
          Expanded(
            child: Center(
              child: _loadingIndicator(isLoading: isLoading),
            ),
          ),
          _roundContinueButton(onPressed: onPressed),
        ],
      ),
    );
  }

  Widget _loadingIndicator({bool isLoading}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 100,
      ),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Palette.darkBlue,
        ),
      ),
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
