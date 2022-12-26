import 'package:animagieeui/view/instancepage/model/communiti_userList.dart';
import 'package:animagieeui/view/instancepage/service/communiti_userList.dart';
import 'package:get/get.dart';

class CommunitiPostListController extends GetxController {
  final data = <Datum>[].obs;
  RxBool userprofilescreenloadingindicator = true.obs;
  communitiListPost(String id) async {
    final response =
        await CommunitiListService.communitiUserPostListService(id);
    try {
      if (response != null) {
        data.value = response.data!;
        userprofilescreenloadingindicator(false);
      } else {
        userprofilescreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
