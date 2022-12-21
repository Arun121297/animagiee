import 'package:animagieeui/view/instancepage/service/instanceservice.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/instancemodel.dart';

class InstanceContoroller extends GetxController {
  List<String> communitylist = [];
  List communitylistimage = [];
  List communitiesname = [];
  final data = <Datum>[].obs;
  RxBool instancescreenloadingindicator = true.obs;
  RxList<CommunitiesList> getinstancedata = <CommunitiesList>[].obs;
  var clint = InstanceService();
  Future instancecontroller() async {
    var response = await clint.instanceservice();
    try {
      getinstancedata.clear();
      if (response != null) {
        getinstancedata.add(response);
        data.value = response.data!;
        instancescreenloadingindicator(false);
      } else {
        instancescreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
