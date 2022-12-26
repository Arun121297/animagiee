import 'package:animagieeui/view/instancepage/model/userProfile_model.dart';
import 'package:animagieeui/view/instancepage/service/userProfile_service.dart';
import 'package:get/get.dart';

class UserPostProfileController extends GetxController {
  final data = <Data1>[].obs;
  RxBool userprofilescreenloadingindicator = true.obs;
  userProfile(String id) async {
    print("datab" + data.length.toString());
    final response = await UserPostProfile.userPostProfile(id);
    try {
      if (response != null) {
        data.value = response.data1!;
        userprofilescreenloadingindicator(false);
      } else {
        userprofilescreenloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
