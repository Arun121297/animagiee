import 'dart:io';

import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/communitypage/view/clubs/myclubs.dart';
import 'package:animagieeui/view/instancepage/model/club_icon.dart';
import 'package:animagieeui/view/instancepage/service/clubicon_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ClubIconController extends GetxController {
  Rx<File> profilebackgroundimage = File("").obs;
  RxBool clubcretedataloadingindicator = true.obs;
  var clint = ClubIconService();

  Future clubIconApi({required id}) async {
    clubcretedataloadingindicator(true);
    try {
      ClubCreation? response;
      response = await clint.clubIconService(
          file: profilebackgroundimage.value.path, id: id);
      if (response != null) {
        // clubcreationdata.clear();
        // clubcreationdata.add(response);

        Get.off(() => MyClubs_UI());
        Fluttertoast.showToast(msg: "Add New Club");
        clubcretedataloadingindicator(false);
        // Get.back();

      } else {
        clubcretedataloadingindicator(false);
        return null;
      }
    } catch (e) {
      print("e$e");
      rethrow;
    }
  }
}
