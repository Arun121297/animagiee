import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/instancepage/model/userProfile_model.dart';
import 'package:animagieeui/view/instancepage/service/userProfile_service.dart';
import 'package:get/get.dart';

class UserPostProfileController extends GetxController {
  final data = <Data1>[].obs;
  RxList<UserProfileModel> removeFollowersData = <UserProfileModel>[].obs;
  RxBool userprofilescreenloadingindicator = true.obs;
  final RxList<UserProfileModel> _followingData = <UserProfileModel>[].obs;
  RxList<UserProfileModel> get followingData => _followingData;
  RxBool isFollowingLoading = true.obs;
  // var followingStatus = <String>[].obs;
  Rx<String> followingStatus = "".obs;
  UserPostProfile service = UserPostProfile();
  Future getFollowingUser({required String id}) async {
    isFollowingLoading(true);
    try {
      final response = await UserPostProfile.userPostProfile(id);
      _followingData.clear();
      // followingStatus.clear();
      if (response != null) {
        _followingData.add(response);

        for (var i = 0; i < response.data1!.length; i++) {
          if (response.data1![i].requestid2!.isEmpty) {
            followingStatus('Follow');
          } else if (response.data1![i].requestid2![0].status == false) {
            followingStatus('Requested');
          } else {
            followingStatus('Unfollow');
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

  followingFollowUser({
    required userId,
  }) async {
    FollowRequestContoller followUnfollowRequestController =
        Get.put(FollowRequestContoller());
    try {
      followUnfollowRequestController.followRequestPost(id: userId);

      if (followingStatus.value == 'Follow') {
        followingStatus('Requested');
      } else if (followingStatus.value == 'Unfollow') {
        followingStatus('Follow');
      }
      //  else if (followStatus[index] == 'Requested') {
      //   followStatus[index] = 'Follow';
      // }
    } catch (e) {
      rethrow;
    }
  }

  userProfile(String id) async {
    print("datab" + data.length.toString());
    final response = await UserPostProfile.userPostProfile(id);
    try {
      if (response != null) {
        data.clear();
        data.value = response.data1!;
        for (var i = 0; i < response.data1!.length; i++) {
          if (response.data1![i].requestid2!.isEmpty) {
            followingStatus('Follow');
          } else if (response.data1![i].requestid2![0].status == false) {
            followingStatus('Requested');
          } else {
            followingStatus('Unfollow');
          }
        }
        userprofilescreenloadingindicator(false);
      } else {
        userprofilescreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
