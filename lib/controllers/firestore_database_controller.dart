import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirestoreDatabaseController extends GetxController {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  DocumentSnapshot documentSnapshot;

  void saveUser(User user) async {
    Map<String, dynamic> userData = {
      "name": user.displayName,
      "email": user.email,
      "role": "student",
      "last_login":
          "${user.metadata.lastSignInTime.hour} : ${user.metadata.lastSignInTime.minute}",
      "created_at":
          "${user.metadata.creationTime.day}/${user.metadata.creationTime.month}/${user.metadata.creationTime.year}",
    };

    final userRef = _db.collection("users").doc(user.email);

    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime.minute,
      });
    } else {
      await userRef.set(userData);
    }
  }
}
