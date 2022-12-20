import 'dart:io';

import 'package:animagieeui/view/instancepage/service/clubicon_service.dart';
import 'package:get/get.dart';

class ClubIconController extends GetxController {
  File profilebackgroundimage = File("");
  var clint = ClubIconService();
  Future clubIconApi() async {
    try {
      var response;
      response = await clint.clubIconService(
        file: profilebackgroundimage.path,
      );
      if (response != null) {
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
