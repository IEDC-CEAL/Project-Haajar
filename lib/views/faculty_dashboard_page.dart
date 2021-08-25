import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_haajar/controllers/auth_controller.dart';

class FacultyDashboardPage extends StatelessWidget {
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty DashBoard Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authController.signOut();
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
