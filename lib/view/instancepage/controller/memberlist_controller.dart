import 'dart:developer';

import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/instancepage/model/member.dart';

import 'package:animagieeui/view/instancepage/service/member_service.dart';
import 'package:get/get.dart';

class MemberListController extends GetxController {
  RxList<ClubMembersModel> memberData = <ClubMembersModel>[].obs;

  RxBool memberscreenloadingindicator = true.obs;
  RxList<String> followStatus = List<String>.empty(growable: true).obs;

  Future memberListPost(String id) async {
    memberscreenloadingindicator(true);
    try {
      final response = await MemberService.memberService(id);
      followStatus.clear();
      memberData.clear();
      if (response != null) {
        memberData.add(response);
        for (var i = 0; i < response.data!.length; i++) {
          if (response.data![i]!.requestid2!.isEmpty) {
            followStatus.insert(i, 'Follow');
          } else if (response.data![i]!.requestid2![0]!.status == false) {
            followStatus.insert(i, 'Requested');
          } else {
            followStatus.insert(i, 'Unfollow');
          }
        }
        log(followStatus.length.toString());
        memberscreenloadingindicator(false);
      } else {
        memberscreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  followUnfollow({
    required userId,
    required index,
  }) async {
    FollowRequestContoller followUnfollowRequestController =
        Get.put(FollowRequestContoller());
    try {
      followUnfollowRequestController.followRequestPost(id: userId);
      if (followStatus[index] == 'Follow') {
        followStatus[index] = 'Requested';
      } else if (followStatus[index] == 'Unfollow') {
        followStatus[index] = 'Follow';
      }
      //  else if (followStatus[index] == 'Requested') {
      //   followStatus[index] = 'Follow';
      // }
    } catch (e) {
      rethrow;
    }
  }
}
