import 'dart:io';

import 'package:animagieeui/view/instancepage/controller/communityController.dart';
import 'package:get/get.dart';

import '../../profilepage/view/loader/loader.dart';
import '../Service/clubcreateservice.dart';
import '../Service/editclubbgservice.dart';
import '../Service/editclubservice.dart';
import '../model/createclubmodel.dart';
import '../model/editclubbgmodel.dart';
import '../model/editclubmodel.dart';

class EditClubController extends GetxController {
  File selectediconimage = File('');
  RxBool editclubbgloadingindicator = true.obs;

  // RxList<EditClubModel> geteditclubbg = <EditClubModel>[].obs;
  var clint = EditClubService();
  Future editclubcontroller(
      {clubid,
      clubname,
      CommunityTypeisPrivate,
      ClubDescription,
      groupName,
      Community,
      clubicon}) async {
    var response = selectediconimage.path.isEmpty
        ? await clint.editclubservicefunction(
            ClubDescription: ClubDescription,
            Community: Community,
            clubicon: clubicon,
            CommunityTypeisPrivat: CommunityTypeisPrivate,
            clubid: clubid,
            clubname: clubname,
            groupName: groupName,
          )
        : await clint.editclubservicefunction(
            ClubDescription: ClubDescription,
            Community: Community,
            clubicon: selectediconimage.path,
            CommunityTypeisPrivat: CommunityTypeisPrivate,
            clubid: clubid,
            clubname: clubname,
            groupName: groupName,
          );
    try {
      if (response != null) {
        // geteditclubbg.clear();
        // geteditclubbg.add(response);
        update();
        Get.back();
        editclubbgloadingindicator(false);
      } else {
        editclubbgloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
