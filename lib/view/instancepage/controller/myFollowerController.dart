import 'package:animagieeui/view/instancepage/model/myFollowersModel.dart';
import 'package:animagieeui/view/instancepage/service/myFollowersService.dart';
import 'package:get/get.dart';

class MyFollowerController extends GetxController {
  RxList<MyFollowers> myFollowerData = <MyFollowers>[].obs;

  RxBool isLoadingService = true.obs;

  myFollower() async {
    print("datab" + myFollowerData.length.toString());
    final response = await MyFollowingService.myFollowerService();
    // final followRequestListController = Get.find<FollowRequestGetController>();
    try {
      if (response != null) {
        myFollowerData.clear();
        myFollowerData.add(response);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
