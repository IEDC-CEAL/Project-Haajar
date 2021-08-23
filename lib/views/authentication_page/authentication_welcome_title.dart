import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthenticationWelcomeTitle extends StatelessWidget {
  const AuthenticationWelcomeTitle(this.title);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: Get.size.height * 0.055,
      ),
    );
  }
}
