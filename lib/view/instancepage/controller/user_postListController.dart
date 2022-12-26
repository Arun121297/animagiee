import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:get/get.dart';

class UserPostListController extends GetxController {
  final data = <Datum>[].obs;

  RxBool isLoadingService = false.obs;
  RxInt currentBanner1 = 0.obs;
  ottApiCall() async {
    final res = await UserPostListService.userPostListService();

    if (res != null) {
      data.value = res.data!;
    }
  }
}
