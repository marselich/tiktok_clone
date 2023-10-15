import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  static bool checkLoginAccount() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
