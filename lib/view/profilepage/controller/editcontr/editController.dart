import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:animagieeui/view/profilepage/service/editservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditScreenController extends GetxController {
  TextEditingController about = TextEditingController();
  String abt = '';
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  // TextEditingController about = TextEditingController();
  // TextEditingController about = TextEditingController();
  RxBool editscreenloadingindicator = true.obs;
  RxList<EditModel> geteditdata = <EditModel>[].obs;
  var clint = EditScreenService();
  Future editprofileservicesection(yourself) async {
    var response = await clint.editprofileservicesection(yourself: yourself);
    log("rse");
    try {
      geteditdata.clear();
      if (response != null) {
        geteditdata.add(response);
        log("profile${geteditdata}");
        editscreenloadingindicator(false);
      } else {
        editscreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
