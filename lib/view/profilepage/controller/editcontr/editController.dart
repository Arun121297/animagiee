import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:animagieeui/view/profilepage/service/editservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/loader/loader.dart';

class EditScreenController extends GetxController {
  TextEditingController about = TextEditingController();
  String abt = '';
  TextEditingController fname = TextEditingController();
  String firstname = '';
  TextEditingController lname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  // File pFprofileimage = File("");
  // TextEditingController about = TextEditingController();
  // TextEditingController about = TextEditingController();
  RxBool profileUpdateLoad = true.obs;
  RxBool editscreenloadingindicator = true.obs;
  File pFprofileimage = File("");

  // RxList<EditModel> geteditdata = <EditModel>[].obs;
  var clint = EditScreenService();
  ProfileController profileController = Get.put(ProfileController());
  Future editprofileservicesection(
    context,
  ) async {
    log("rse");
    try {
      if (profileUpdateLoad.value) {
        _loadingBar(context);
      }
      var response;
      if (pFprofileimage == File('')) {
        response = await clint.editprofileservicesection(
            fname: fname.text, yourself: about.text, profile_picture: '');
      } else {
        response = await clint.editprofileservicesection(
            fname: fname.text,
            yourself: about.text,
            profile_picture: pFprofileimage.path);
      }

      if (response != null) {
        editscreenloadingindicator(false);
        profileController.profileloadingindecator(true);
      } else {
        editscreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
