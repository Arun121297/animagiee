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
    var response = await clint.profileservicesection();
    log("rse");
    try {
      getprofiledata.clear();
      if (response != null) {
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
