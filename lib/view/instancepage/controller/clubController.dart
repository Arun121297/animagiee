import 'dart:io';

import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/communitypage/view/clubs/myclubs.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:animagieeui/view/instancepage/service/club_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClubController extends GetxController {
  File pFprofileimage = File("");
  RxList<ClubCreationModel> clubcreationdata = <ClubCreationModel>[].obs;
  final relatedData = <Data>[].obs;
  TextEditingController groupName = TextEditingController();
  TextEditingController clubDescription = TextEditingController();
  TextEditingController clubName = TextEditingController();
  RxBool communityTypeisPrivate = false.obs;
  String id = '';
  RxString communityTypeisPrivat = ''.obs;
  var clint = ClubService();
  Future clubApi() async {
    try {
      var response;
      response = await clint.clubService(
        clubDescription: clubDescription.text,
        clubName: clubName.text,
        community: id,
        communityTypeisPrivate: communityTypeisPrivate.value,
        file: pFprofileimage.path,
        groupName: groupName.text,
      );
      if (response != null) {
        Get.to(MyClubs_UI());
        // clubcreationdata.clear();
        // clubcreationdata.add(response);
      } else {
        return null;
      }
    } catch (e) {
      print("e$e");
      rethrow;
    }
  }
}
