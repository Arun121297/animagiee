import 'package:animagieeui/view/instancepage/model/likeModel.dart';
import 'package:animagieeui/view/instancepage/service/likeService.dart';
import 'package:get/get.dart';

class LikeContoller extends GetxController {
  RxList<LikeModel> likeData = <LikeModel>[].obs;
  RxBool isLoading = true.obs;

  like({required String id, required index}) async {
    print("datab" + likeData.length.toString());
    final response = await LikesService.likesService(id);
    try {
      if (response != null) {
        likeData.clear();
        likeData.add(response);
      } else {
        isLoading(false);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
