import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const USER_ID = "USER_ID";

  static Future<void> saveUserId(String userId) async {
    final sharedPref = GetIt.I.get<SharedPreferences>();
    await sharedPref.setString(USER_ID, userId);
  }

  static Future<void> clearSharedPref() async {
    final sharedPref = GetIt.I.get<SharedPreferences>();
    await sharedPref.clear();
  }

  static String getUserId() {
    final sharedPref = GetIt.I.get<SharedPreferences>();
    return sharedPref.getString(USER_ID) ?? "";
  }
}
