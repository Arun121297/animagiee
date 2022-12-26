import 'package:animagieeui/config/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLogin {
  Future checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token;
    token = sharedPreferences.getString(Constant.authToken);

    return token;
  }
}
