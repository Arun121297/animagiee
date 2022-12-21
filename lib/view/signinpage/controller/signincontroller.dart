import 'dart:developer';

import 'package:animagieeui/view/instancepage/view/intrestpage.dart';
import 'package:animagieeui/view/signinpage/model/signinreg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constance.dart';
import '../service/signinservice.dart';

class SigninController extends GetxController {
  //loading indicator
  RxBool loadingindicator = true.obs;
  //datas list
  RxList<SigninRegister> getsigninmodel = <SigninRegister>[].obs;
  var clint = SigninService();
  signinfunction(email, username) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      var response = await clint.signinservice(email: email, username: email);
      // log("signincontroller-->$response");
      if (response != null) {
        _sharedPreferences.setString(Constants.authToken, response.token!);
        log("tokenreg-->${response.token}");
        getsigninmodel.add(response);
        log("datassss->>>>>>>>>${getsigninmodel[0].data}");
        loadingindicator(false);
        Get.to(Welcome_Page());
        // log(loadingindicator.toString());
      } else {
        // Fluttertoast.showToast(msg: response!.message!);
        Get.back();
      }
    } catch (e) {
      log("error$e");
      rethrow;
    }
  }
}
