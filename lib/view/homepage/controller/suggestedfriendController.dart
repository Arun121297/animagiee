// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:get/get.dart';

import '../Service/homescreen1service.dart';
import '../Service/suggestedFriendService.dart';
import '../model/HomeScreen1model.dart';
import '../model/suggestedFriendListModel.dart';

class SugestedFrindListController extends GetxController {
  var Suggesteddata = <SuggestedFriendList>[].obs;
  var followStatus = <String>[].obs;
  // String requestType = '';

  var requestType = List<dynamic>.empty(growable: true).obs;
  // RxList requestType = <SuggestedFriendList>[].obs;

  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  suggestedcontrollerfunction() async {
    final res = await UserSuggestenFriendService.suggestionfriend();

    if (res != null) {
      requestType.clear();
      for (int i = 0; i < res.data!.length; i++) {
        requestType.add(res.data![i].requestStatus);
      }
      Suggesteddata.clear();
      Suggesteddata.add(res);
      isLoadingService(false);
    } else {
      isLoadingService(false);
    }
  }

  followUnfollow(
      {required index, required userId, required requestStatus}) async {
    FollowRequestContoller followUnfollowRequestController =
        Get.put(FollowRequestContoller());
    try {
      followUnfollowRequestController.followRequestPost(id: userId);
      if (requestStatus) {
        if (followStatus[index] == 'Follow') {
          followStatus[index] = 'Requested';
        } else if (followStatus[index] == 'Requested') {
          followStatus[index] = 'Follow';
        }
      } else {
        if (followStatus[index] == 'Follow') {
          followStatus[index] = 'Unfollow';
        } else if (followStatus[index] == 'Unfollow') {
          followStatus[index] = 'Follow';
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
