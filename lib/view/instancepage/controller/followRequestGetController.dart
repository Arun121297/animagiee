import 'package:animagieeui/view/instancepage/model/followRequestGetModel.dart';
import 'package:animagieeui/view/instancepage/service/followRequestGetService.dart';
import 'package:get/get.dart';

class FollowRequestGetController extends GetxController {
  RxList<FollowRequestGetModel> data = <FollowRequestGetModel>[].obs;
  RxBool followrequestgetloadingindicator = true.obs;
  followRequestGetPost() async {
    final response = await FollowRequestGetService.followRequestGet();
    try {
      if (response != null) {
        data.clear();
        data.add(response);
        followrequestgetloadingindicator(false);
      } else {
        followrequestgetloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
