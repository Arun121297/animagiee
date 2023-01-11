// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:get/get.dart';

import '../Service/commentlistservice.dart';
import '../Service/homescreen1service.dart';
// import '../model/HomeScreen1model.dart';
import '../model/commendlistmodel.dart';

class PostCommendListController extends GetxController {
  RxList<Commentlistmodel> data = <Commentlistmodel>[].obs;
  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  postcommed(postid) async {
    // isLoadingService(true);

    try {
      data.clear();
      final res = await MyCommendListService.mycommentlistservicefunction(
          postid: postid);
      // isLoadingService(true);
      if (res != null) {
        data.clear();
        data.add(res);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
