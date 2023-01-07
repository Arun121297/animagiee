import 'package:animagieeui/view/instancepage/model/user_postGetmodel.dart';
import 'package:animagieeui/view/instancepage/service/user_postListGetservice.dart';
import 'package:get/get.dart';

class UserPostGetProfilePostController extends GetxController {
  RxList<UserPostListGetModel> data = <UserPostListGetModel>[].obs;
  RxBool userprofilescreenloadingindicator = true.obs;
  userProfilePost(String id) async {
    print("datab" + data.length.toString());
    final response = await UserPostGetListService.userPostGetListService(id);

    try {
      if (response != null) {
        data.clear();
        data.add(response);
        userprofilescreenloadingindicator(false);
      } else {
        userprofilescreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
