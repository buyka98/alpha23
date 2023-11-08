import 'package:shared_preferences/shared_preferences.dart';

late Cache cache;
late SharedPreferences sharedStorage;

class Cache {
  static Cache? _instance;

  factory Cache() {
    _instance ??= Cache._internal();
    return _instance!;
  }

  Cache._internal() {
    _init();
  }

  bool isRemember = false;
  String? rememberEmail;
  String? rememberPassword;

  _init() async {
    sharedStorage = await SharedPreferences.getInstance();
    isRemember = sharedStorage.getBool("is_remember") ?? false;
    rememberEmail = sharedStorage.getString("email");
    rememberPassword = sharedStorage.getString("password");
  }

  void rememberUser(bool remember, {String? email, String? password}) {
    isRemember = remember;

    if (remember) {
      rememberEmail = email;
      rememberPassword = password;
      sharedStorage.setBool("is_remember", remember);
      sharedStorage.setString("email", email!);
      sharedStorage.setString("password", password!);
    } else {
      rememberEmail = null;
      rememberPassword = null;
      sharedStorage.remove("is_remember");
      sharedStorage.remove("email");
      sharedStorage.remove("password");
    }
  }
}
