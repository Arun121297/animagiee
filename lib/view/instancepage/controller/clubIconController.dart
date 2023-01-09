import 'dart:io';

import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/instancepage/model/club_icon.dart';
import 'package:animagieeui/view/instancepage/service/clubicon_service.dart';
import 'package:get/get.dart';

class ClubIconController extends GetxController {
  Rx<File> profilebackgroundimage = File("").obs;

  var clint = ClubIconService();

  Future clubIconApi({required id}) async {
    MyClubController clubController = Get.find();
    try {
      ClubCreation? response;
      response = await clint.clubIconService(
          file: profilebackgroundimage.value.path, id: id);
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
