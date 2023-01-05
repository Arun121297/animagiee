import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/userprofile/models/other_user_followers_model.dart';
import 'package:animagieeui/view/userprofile/models/other_user_following_model.dart';
import 'package:animagieeui/view/userprofile/services/other_user_service.dart';
import 'package:get/get.dart';

class OtherUserController extends GetxController {
  final RxList<OtherUserFollowingModel> _followingData =
      <OtherUserFollowingModel>[].obs;
  RxList<OtherUserFollowingModel> get followingData => _followingData;
  RxBool isFollowingLoading = true.obs;
  RxList<String> followingStatus = List<String>.empty(growable: true).obs;
  OtherUserService service = OtherUserService();
  Future getFollowing({required String id}) async {
    isFollowingLoading(true);
    try {
      final response = await service.otherUserFollowingService(id);
      _followingData.clear();
      followingStatus.clear();
      if (response != null) {
        _followingData.add(response);

        for (var i = 0; i < response.data!.length; i++) {
          if (response.data![i].requestid2!.isEmpty) {
            followingStatus.insert(i, 'Follow');
          } else if (response.data![i].requestid2![0].status == false) {
            followingStatus.insert(i, 'Requested');
          } else {
            followingStatus.insert(i, 'Unfollow');
          }
        }

        isFollowingLoading(false);
      } else {
        isFollowingLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  final RxList<OtherUserFollowersModel> _followersData =
      <OtherUserFollowersModel>[].obs;
  RxList<OtherUserFollowersModel> get followersData => _followersData;
  RxBool isFollowersLoading = true.obs;
  RxList<String> followersStatus = List<String>.empty(growable: true).obs;
  Future getFollowers({required String id}) async {
    isFollowersLoading(true);
    try {
      final response = await service.otherUserFollowersService(id);
      _followersData.clear();
      followersStatus.clear();
      if (response != null) {
        _followersData.add(response);
        for (var i = 0; i < response.data!.length; i++) {
          if (response.data![i].requestid2!.isEmpty) {
            followersStatus.insert(i, 'Follow');
          } else if (response.data![i].requestid2![0].status == false) {
            followersStatus.insert(i, 'Requested');
          } else {
            followersStatus.insert(i, 'Unfollow');
          }
        }

        isFollowersLoading(false);
      } else {
        isFollowersLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  followersFollow({
    required userId,
    required index,
  }) async {
    FollowRequestContoller followUnfollowRequestController =
        Get.put(FollowRequestContoller());
    try {
      followUnfollowRequestController.followRequestPost(id: userId);
      if (followersStatus[index] == 'Follow') {
        followersStatus[index] = 'Requested';
      } else if (followersStatus[index] == 'Unfollow') {
        followersStatus[index] = 'Follow';
      }
      //  else if (followStatus[index] == 'Requested') {
      //   followStatus[index] = 'Follow';
      // }
    } catch (e) {
      rethrow;
    }
  }

  followingFollow({
    required userId,
    required index,
  }) async {
    FollowRequestContoller followUnfollowRequestController =
        Get.put(FollowRequestContoller());
    try {
      followUnfollowRequestController.followRequestPost(id: userId);
      if (followingStatus[index] == 'Follow') {
        followingStatus[index] = 'Requested';
      } else if (followingStatus[index] == 'Unfollow') {
        followingStatus[index] = 'Follow';
      }
      //  else if (followStatus[index] == 'Requested') {
      //   followStatus[index] = 'Follow';
      // }
    } catch (e) {
      rethrow;
    }
  }
}
