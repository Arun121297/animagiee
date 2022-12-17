import 'package:get/get.dart';

import '../model/updateinstance.dart';
import '../service/updateinstanceservice.dart';

class UpdataInstanceController extends GetxController {
  RxBool updateinstanceloadingindicator = true.obs;
  RxList<UpdateInstanceModel> getUpdateinstancedata =
      <UpdateInstanceModel>[].obs;
  var clint = UpdateInstanceService();
  Future updateinstancecontroller(instancelist) async {
    var response = await clint.updateService(instancelist: instancelist);
    try {
      if (response != null) {
        getUpdateinstancedata.clear();
        getUpdateinstancedata.add(response);

        updateinstanceloadingindicator(false);
      } else {
        updateinstanceloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
