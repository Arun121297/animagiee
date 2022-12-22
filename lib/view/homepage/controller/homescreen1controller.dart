// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:get/get.dart';

import '../Service/homescreen1service.dart';
import '../model/HomeScreen1model.dart';

class UserPostListController extends GetxController {
  var data = <UserPostListModel>[].obs;

  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  ottApiCall() async {
    final res = await UserPostListService.userPostListService();

    if (res != null) {
      data.clear();
      data.add(res);
      isLoadingService(false);
    } else {
      isLoadingService(false);
    }
  }
}
