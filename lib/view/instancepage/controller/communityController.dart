import 'package:animagieeui/view/instancepage/model/communityProfile.dart';
import 'package:animagieeui/view/instancepage/service/community_service.dart';
import 'package:get/get.dart';

class CommunityProfileContoller extends GetxController {
  RxList<CommunityProfileModel> communityData = <CommunityProfileModel>[].obs;
  RxBool isLoading = true.obs;

  communityProfile({required String id}) async {
    print("datab" + communityData.length.toString());
    final response = await CommunityProfileService.communityProfileService(id);
    try {
      if (response != null) {
        communityData.clear();
        communityData.add(response);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
