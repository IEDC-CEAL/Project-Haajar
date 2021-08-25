import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:project_haajar/controllers/auth_controller.dart';
import 'package:project_haajar/views/authentication_page/authentication_page.dart';
import 'package:project_haajar/views/dashboard_page.dart';

class Root extends GetWidget {
  final _authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _authController.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user != null) {
              // _authController.saveUser(snapshot.data);
              return DashboardPage();
            }
            return AuthenticationPage();
          }
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        });
  }
}
