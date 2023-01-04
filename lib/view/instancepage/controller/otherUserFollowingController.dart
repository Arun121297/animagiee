import 'package:animagieeui/view/instancepage/model/otherUserFollowing.dart';
import 'package:animagieeui/view/instancepage/service/otherUserFollowing.dart';
import 'package:get/get.dart';

class OtherUserFollowingContoller extends GetxController {
  RxList<OtherUserFollowing> otherFollowingUserData =
      <OtherUserFollowing>[].obs;
  RxBool isLoading = true.obs;

  otherUserFollowing({required String id}) async {
    print("datab" + otherFollowingUserData.length.toString());
    final response =
        await OtherUserFollowingService.otherUserFollowingService(id);
    try {
      if (response != null) {
        otherFollowingUserData.clear();
        otherFollowingUserData.add(response);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
