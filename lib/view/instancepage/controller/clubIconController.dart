import 'dart:io';

import 'package:animagieeui/view/instancepage/controller/clubController.dart';
import 'package:animagieeui/view/instancepage/model/club_icon.dart';
import 'package:animagieeui/view/instancepage/service/clubicon_service.dart';
import 'package:get/get.dart';

class ClubIconController extends GetxController {
  File profilebackgroundimage = File("");
  var clint = ClubIconService();

  Future clubIconApi({required id}) async {
    ClubController clubController = Get.find();
    try {
      ClubCreation? response;
      response = await clint.clubIconService(
          file: profilebackgroundimage.path, id: id);
      if (response != null) {
        // clubcreationdata.clear();
        // clubcreationdata.add(response);
        Get.back();
      } else {
        return null;
      }
    } catch (e) {
      print("e$e");
      rethrow;
    }
  }
}
