// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:get/get.dart';

import '../Service/homescreen1service.dart';
import '../Service/suggestedFriendService.dart';
import '../model/HomeScreen1model.dart';
import '../model/suggestedFriendListModel.dart';

class SugestedFrindListController extends GetxController {
  var Suggesteddata = <SuggestedFriendList>[].obs;

  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  suggestedcontrollerfunction() async {
    final res = await UserSuggestenFriendService.suggestionfriend();

    if (res != null) {
      Suggesteddata.clear();
      Suggesteddata.add(res);
      isLoadingService(false);
    } else {
      isLoadingService(false);
    }
  }
}
