// currentuserpostlist
import 'dart:developer';

import 'package:animagieeui/view/profilepage/model/profiledata.dart';
import 'package:animagieeui/view/profilepage/model/userpostmodellist.dart';
import 'package:animagieeui/view/profilepage/service/profileservice.dart';
import 'package:get/get.dart';

import '../service/userpostlistservice.dart';

class CurrentUserlistController extends GetxController {
  RxList<UserPostModelList> currentuserlist = <UserPostModelList>[].obs;
  RxBool iscurrentpostloading = true.obs;
  var clint = UserPostServiceList();
  Future getmyProfilelist(id) async {
    iscurrentpostloading(true);
    log("rse");
    try {
      var response = await clint.currentuserpostlist(Id: id);

      if (response != null) {
        currentuserlist.clear();
        currentuserlist.add(response);
        log("profile$currentuserlist");
        iscurrentpostloading(false);
      } else {
        iscurrentpostloading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
