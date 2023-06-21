import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefUtils {

  String? getToken();
  void setToken(String token);
  void removeToken();

}

class PrefUtilsImpl implements PrefUtils {

  final SharedPreferences sharedPreferences;

  PrefUtilsImpl(
      {required this.sharedPreferences,
      }
      );



  @override
  String? getToken() {
    return sharedPreferences.getString("token");
  }

  @override
  void setToken(String token) {
    sharedPreferences.setString("token", token);
  }

  @override
  void removeToken() {

    const CACHED_USER = "LOGGED_USER";
    sharedPreferences.remove("token");

    if (sharedPreferences.getString(CACHED_USER) != null) {
      sharedPreferences.remove(CACHED_USER);

    }
  }
}