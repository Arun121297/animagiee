import 'package:animagieeui/view/homepage/view/homepagewidget.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestGetController.dart';
import 'package:animagieeui/view/instancepage/model/ignoreFollowRequest.dart';
import 'package:animagieeui/view/instancepage/service/ignoreFollowRequest.dart';
import 'package:get/get.dart';

class DeleteFollowRequestController extends GetxController {
  RxList<DeleteFollowRequest> deleteRequestData = <DeleteFollowRequest>[].obs;

  RxBool isLoadingService = true.obs;

  deleteFollowRequestPost({required String id}) async {
    print("datab" + deleteRequestData.length.toString());
    final response =
        await DeleteFollowRequestService.deleteFollowRequestService(id);
    final followRequestListController = Get.find<FollowRequestGetController>();
    try {
      if (response != null) {
        Get.back();
        deleteRequestData.clear();
        deleteRequestData.add(response);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
