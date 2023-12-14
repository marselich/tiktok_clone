import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_clone/models/user/user_model.dart';

class FirebaseUtils {
  static bool checkLoginAccount() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<UserModel?> getCurrentUserModel() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }

    final userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    return UserModel.fromSnap(userSnapshot);
  }
}
