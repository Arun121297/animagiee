import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/profiledata.dart';
import 'package:animagieeui/view/profilepage/service/profileservice.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // RxBool profileloadingindecator = true.obs;
  String abt = '';
  final RxList<ProfileModel> _getprofiledata = <ProfileModel>[].obs;
  RxList<ProfileModel> get profileData => _getprofiledata;
  RxBool isProfileLoading = true.obs;
  var clint = ProfileService();
  Future getProfile() async {
    isProfileLoading(true);
    log("rse");
    try {
      var response = await clint.profileservicesection();

      if (response != null) {
        _getprofiledata.clear();
        _getprofiledata.add(response);
        log("oooooooooooooooo${_getprofiledata.first.data!.about!}");
        isProfileLoading(false);
      } else {
        Get.back();
        isProfileLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
