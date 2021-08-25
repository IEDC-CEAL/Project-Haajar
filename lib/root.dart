import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:project_haajar/controllers/auth_controller.dart';
import 'package:project_haajar/views/authentication_page/authentication_page.dart';
import 'package:project_haajar/views/faculty_dashboard_page.dart';
import 'package:project_haajar/views/student_dashboard_page.dart';

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
            _authController.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.email)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  if (userDoc.get("role") == "faculty") {
                    return FacultyDashboardPage();
                  } else {
                    return StudentDashboardPage();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return AuthenticationPage();
        }
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
