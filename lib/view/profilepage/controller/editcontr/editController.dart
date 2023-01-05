import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:animagieeui/view/profilepage/service/editservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/loader/loader.dart';

class EditScreenController extends GetxController {
  TextEditingController about = TextEditingController();
  // String abt = '';
  TextEditingController fname = TextEditingController();
  // String firstname = '';
  TextEditingController lname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  RxString profession = "".obs;
  RxString gender = "".obs;
  RxString state = "".obs;
  RxString city = "".obs;

  // File pFprofileimage = File("");
  // TextEditingController about = TextEditingController();
  // TextEditingController about = TextEditingController();
  RxBool isProfileEditLoading = true.obs;
  File pFprofileimage = File("");

  // RxList<EditModel> geteditdata = <EditModel>[].obs;
  var clint = EditScreenService();
  ProfileController profileController = Get.put(ProfileController());
  Future editprofileservicesection(
    context,
  ) async {
    isProfileEditLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    log("rse");
    try {
      if (isProfileEditLoading.value) {
        _loadingBar(context);
      }
      EditModel? response;
      if (pFprofileimage == File('')) {
        response = await clint.editprofileservicesection(
            lname: lname.text,
            address: address.text,
            dob: dob.text,
            mnumber: mNumber.text,
            picode: pincode.text,
            fname: fname.text,
            email: email.text,
            yourself: about.text,
            profilePicture: File(''));
      } else {
        response = await clint.editprofileservicesection(
            lname: lname.text,
            address: address.text,
            email: email.text,
            dob: dob.text,
            mnumber: mNumber.text,
            picode: pincode.text,
            fname: fname.text,
            yourself: about.text,
            profilePicture: pFprofileimage.path);
      }

      if (response != null) {
        pref.setString(Constant.mobileNumber,
            response.data!.mobNo == 0 ? "" : response.data!.mobNo.toString());
        pref.setString(Constant.profileImage, response.data!.profileicon!);

        pref.setString(Constant.userId, response.data!.id!);
        pref.setString(Constant.userName, response.data!.username!);
        Get.back();
        isProfileEditLoading(false);
      } else {
        Get.back();

        isProfileEditLoading(false);
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
