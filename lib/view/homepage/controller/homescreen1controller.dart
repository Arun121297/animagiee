// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:get/get.dart';

import '../Service/homescreen1service.dart';
import '../model/HomeScreen1model.dart';

class UserPostListController extends GetxController {
  RxList<UserPostListModel> data = <UserPostListModel>[].obs;
  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  getHome() async {
    isLoadingService(true);

    try {
      data.clear();
      final res = await UserPostListService.userPostListService();
      // isLoadingService(true);
      if (res != null) {
        data.clear();
        data.add(res);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
