import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/profiledata.dart';
import 'package:animagieeui/view/profilepage/service/profileservice.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // RxBool profileloadingindecator = true.obs;
  String abt = '';
  RxList<ProfileModel> getprofiledata = <ProfileModel>[].obs;
  RxBool isProfileLoading = true.obs;
  var clint = ProfileService();
  Future getProfile() async {
    isProfileLoading(true);
    log("rse");
    try {
      var response = await clint.profileservicesection();

      if (response != null) {
        getprofiledata.clear();
        getprofiledata.add(response);
        log("profile$getprofiledata");
        isProfileLoading(false);
      } else {
        isProfileLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
