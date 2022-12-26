import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/view/profilepage/controller/editcontr/editController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/backgroundimagemodel.dart';
import '../../service/bgimageservice.dart';
import '../../view/loader/loader.dart';

class ProfileBGImageController extends GetxController {
  RxList<ProfileBackGroundImageModel> bgImagedata =
      <ProfileBackGroundImageModel>[].obs;
  RxBool bgimageloadingindicator = true.obs;
  // File profilebackgroundimage = File("");
  EditScreenController editScreenController = Get.put(EditScreenController());
  var clint = BGService();
  File profilebackgroundimage = File("");
  RxBool profileUpdateLoad = true.obs;

  Future profileBgController(context) async {
    log("rse");
    try {
      var response;

      if (profilebackgroundimage == File('')) {
        response = await clint.profilebGimageservice(bgimage: File(''));
      } else {
        response = await clint.profilebGimageservice(
            bgimage: profilebackgroundimage.path);
      }
      if (response != null) {
        bgimageloadingindicator(false);
      } else {
        bgimageloadingindicator(false);
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
