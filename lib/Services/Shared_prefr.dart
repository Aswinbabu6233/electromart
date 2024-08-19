import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  static String UserIdKey = "USERKEY";
  static String UserNameKey = "USERNAMEKEY";
  static String UserEmailKey = "USEREMAILKEY";
  static String UserImageKey = "USERIMAGEKEY";

  Future<bool> SaveUserID(String getUserID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(UserIdKey, getUserID);
  }

  Future<bool> SaveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(UserNameKey, getUserName);
  }

  Future<bool> SaveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(UserEmailKey, getUserEmail);
  }

  Future<bool> SaveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(UserImageKey, getUserImage);
  }

  Future<String?> getUSerID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserIdKey);
  }

  Future<String?> getUSerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserNameKey);
  }

  Future<String?> getUSerEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserEmailKey);
  }

  Future<String?> getUSerImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserImageKey);
  }
}
