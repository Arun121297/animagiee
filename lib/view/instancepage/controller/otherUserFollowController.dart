import 'package:animagieeui/view/instancepage/model/otherUserFollow.dart';
import 'package:animagieeui/view/instancepage/service/otherUserFollow.dart';
import 'package:get/get.dart';

class OtherUserFollowContoller extends GetxController {
  RxList<OtherUserFollow> otherFollowUserData = <OtherUserFollow>[].obs;
  RxBool isLoading = true.obs;

  otherUserFollow({required String id}) async {
    print("datab" + otherFollowUserData.length.toString());
    final response = await OtherUserFollowService.otherUserFollowService(id);
    try {
      if (response != null) {
        otherFollowUserData.clear();
        otherFollowUserData.add(response);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
