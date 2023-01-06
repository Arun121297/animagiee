import 'package:animagieeui/view/instancepage/model/member.dart';

import 'package:animagieeui/view/instancepage/service/member_service.dart';
import 'package:get/get.dart';

class MemberListController extends GetxController {
  RxList<Member> memberData = <Member>[].obs;
  RxBool memberscreenloadingindicator = true.obs;
  memberListPost(String id) async {
    final response = await MemberService.memberService(id);
    try {
      if (response != null) {
        memberData.clear();
        memberData.add(response);

        memberscreenloadingindicator(true);
      } else {
        memberscreenloadingindicator(true);
      }
    } catch (e) {
      rethrow;
    }
  }
}
