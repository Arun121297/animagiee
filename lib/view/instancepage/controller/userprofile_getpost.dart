import 'package:animagieeui/view/instancepage/model/user_postGetmodel.dart';
import 'package:animagieeui/view/instancepage/service/user_postListGetservice.dart';
import 'package:get/get.dart';

class UserPostProfilePostController extends GetxController {
  final data = <Datum>[].obs;
  RxBool userprofilescreenloadingindicator = true.obs;
  userProfilePost(String id) async {
    print("datab" + data.length.toString());
    final response = await UserPostGetListService.userPostGetListService(id);
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
