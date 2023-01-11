// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:animagieeui/view/homepage/controller/homescreen1controller.dart';
import 'package:get/get.dart';

import '../Service/homescreen1service.dart';
import '../Service/mypostdelet.dart';
import '../model/HomeScreen1model.dart';

class MypostDeletController extends GetxController {
  // RxList< > data = < >[].obs;
  RxBool isLoadingService = true.obs;
  UserPostListController controller = Get.find();
  // RxInt currentBanner1 = 0.obs;
  mydeletpost(postid) async {
    isLoadingService(true);

    try {
      // data.clear();
      final res =
          await MypostDeletService.mypostdeletservicefunction(postid: postid);
      // isLoadingService(true);
      if (res != null) {
        // data.clear();
        // data.add(res);
        // Get.find<UserPostListController>();
        // controller.isLoadingService(true);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
