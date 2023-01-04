import 'package:animagieeui/view/instancepage/model/removeFollow.dart';
import 'package:animagieeui/view/instancepage/service/removeFollow.dart';
import 'package:get/get.dart';

class RemoveFollowersContoller extends GetxController {
  RxList<RemoveFollowers> removeFollowersData = <RemoveFollowers>[].obs;
  RxBool isLoading = true.obs;

  removeFollowers({required String id}) async {
    print("datab" + removeFollowersData.length.toString());
    final response = await RemoveFollowersService.removeFollowersService(id);
    try {
      if (response != null) {
        removeFollowersData.clear();
        removeFollowersData.add(response);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
