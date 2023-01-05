import 'package:animagieeui/view/instancepage/model/followRequestModel.dart';
import 'package:animagieeui/view/instancepage/service/followRequestService.dart';
import 'package:get/get.dart';

class FollowRequestContoller extends GetxController {
  RxList<FollowRequestModel> data = <FollowRequestModel>[].obs;
  RxBool followRequestloadingindicator = true.obs;

  followRequestPost({required String id}) async {
    print("datab${data.length}");
    final response = await FollowRequestService.followRequestService(id);
    try {
      if (response != null) {
        data.clear();
        data.add(response);
        followRequestloadingindicator(false);
      } else {
        followRequestloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
