import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/profiledata.dart';
import 'package:animagieeui/view/profilepage/service/profileservice.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool profileloadingindecator = true.obs;
  String abt = '';
  RxList<ProfileModel> getprofiledata = <ProfileModel>[].obs;
  var clint = ProfileService();
  Future profilecontrollerfunction() async {
    // profileloadingindecator(true);
    var response = await clint.profileservicesection();
    log("rse");
    try {
      if (response != null) {
        getprofiledata.clear();
        getprofiledata.add(response);
        log("profile${getprofiledata}");
        profileloadingindecator(false);
      } else {
        profileloadingindecator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
