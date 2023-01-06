import 'dart:developer';

import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
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
  Controller dashboardController = Get.put(Controller());
  var clint = SigninService();
  signinfunction(email, username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      var response =
          await clint.signinservice(email: email, username: username);
      // log("signincontroller-->$response");
      if (response != null) {
        sharedPreferences.setString(Constants.authToken, response.token ?? "");
        sharedPreferences.setString(
            Constants.userName, response.data!.first.username!);
        sharedPreferences.setString(Constants.userId, response.data!.first.id!);
        sharedPreferences.setString(
            Constants.profileImage, response.data!.first.profileicon ?? "");
        log("tokenreg-->${response.token}");
        getsigninmodel.clear();
        getsigninmodel.add(response);
        log("datassss->>>>>>>>>${getsigninmodel[0].data}");
        loadingindicator(false);
        if (response.message.toString() == "alreadyexists") {
          dashboardController.selectedIndex(0);
          Get.to(() => Home_Page());
        } else {
          Get.to(() => const Welcome_Page());
        }
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
