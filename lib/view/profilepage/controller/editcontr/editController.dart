import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:animagieeui/view/profilepage/model/editmodel.dart';
import 'package:animagieeui/view/profilepage/service/editservice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  Future<bool?> editprofileservicesection(
    context,
  ) async {
    if (gender.isEmpty) {
      Fluttertoast.showToast(msg: "Please select gender");
    } else if (dob.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please select DOB");
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter email");
    } else if (mNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter mobile number");
    } else if (mNumber.text.length != 10) {
      Fluttertoast.showToast(msg: "Please enter valid mobile number");
    } else if (state.isEmpty) {
      Fluttertoast.showToast(msg: "Please select state");
    } else if (city.isEmpty) {
      Fluttertoast.showToast(msg: "Please select city");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter pincode");
    } else if (pincode.text.length != 6) {
      Fluttertoast.showToast(msg: "Please enter valid pincode");
    } else {
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
          return true;
        } else {
          Get.back();

          isProfileEditLoading(false);
          return false;
        }
      } catch (e) {
        rethrow;
      }
    }
    return null;
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
