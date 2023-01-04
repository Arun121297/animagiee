import 'package:animagieeui/view/instancepage/model/myFollowingUser.dart';
import 'package:animagieeui/view/instancepage/service/myFollowingUser.dart';
import 'package:get/get.dart';

class MyFollowingUserController extends GetxController {
  RxList<MyFollowerUser> myFollowuserData = <MyFollowerUser>[].obs;

  RxBool isLoadingService = true.obs;

  myFollowerUser() async {
    print("datab" + myFollowuserData.length.toString());
    final response = await MyFollowerUserService.myFollowerUserService();
    // final followRequestListController = Get.find<FollowRequestGetController>();
    try {
      if (response != null) {
        myFollowuserData.clear();
        myFollowuserData.add(response);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
