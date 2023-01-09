import 'dart:io';

import 'package:get/get.dart';

import '../Service/clubcreateservice.dart';
import '../Service/editclubbgservice.dart';
import '../model/createclubmodel.dart';
import '../model/editclubbgmodel.dart';

class EditClubbgController extends GetxController {
  RxBool editclubbgloadingindicator = true.obs;
  RxList<EditClubbgiconModel> geteditclubbg = <EditClubbgiconModel>[].obs;
  var clint = EditClubbgService();
  Rx<File> selectedbgimage = File("").obs;
  Future editclubbgcontroller(
      {clubid,
      clubname,
      CommunityTypeisPrivate,
      ClubDescription,
      groupName,
      Community,
      clubicon}) async {
    var response = selectedbgimage.value.path.isEmpty
        ? await clint.editclubbgservicefunction(
            ClubDescription: ClubDescription,
            Community: Community,
            CommunityTypeisPrivat: CommunityTypeisPrivate,
            clubid: clubid,
            clubname: clubname,
            groupName: groupName,
            clubicon: clubicon,
          )
        : await clint.editclubbgservicefunction(
            ClubDescription: ClubDescription,
            Community: Community,
            CommunityTypeisPrivat: CommunityTypeisPrivate,
            clubid: clubid,
            clubname: clubname,
            groupName: groupName,
            clubicon: selectedbgimage.value.path,
          );
    try {
      if (response != null) {
        geteditclubbg.clear();
        geteditclubbg.add(response);
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
