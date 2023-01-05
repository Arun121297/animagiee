import 'package:animagieeui/view/instancepage/model/communityPostList.dart';
import 'package:animagieeui/view/instancepage/service/communityPostList_service.dart';
import 'package:get/get.dart';

class CommunityPostListContoller extends GetxController {
  RxList<CommunityPostList> communityPostListData = <CommunityPostList>[].obs;
  RxBool isLoading = true.obs;

  communityPostList({required String id, required String userId}) async {
    print("datab" + communityPostListData.length.toString());
    final response = await CommunityPostListService.communityPostListService(
      userId,
      id,
    );
    try {
      if (response != null) {
        communityPostListData.clear();
        communityPostListData.add(response);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
