import 'package:animagieeui/view/homepage/view/homepagewidget.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestGetController.dart';
import 'package:animagieeui/view/instancepage/model/confirmFollowRequestModel.dart';
import 'package:animagieeui/view/instancepage/service/confirmFollowRequest.dart';
import 'package:get/get.dart';

class ConfirmFollowRequestController extends GetxController {
  RxList<ConfirmFollowRequest> confirmRequestData =
      <ConfirmFollowRequest>[].obs;

  RxBool isLoadingService = true.obs;

  confirmFollowRequestPost({required String id}) async {
    print("datab" + confirmRequestData.length.toString());
    final response =
        await ConfirmFollowRequestService.confirmFollowRequestService(id);
    final followRequestListController = Get.find<FollowRequestGetController>();
    try {
      if (response != null) {
        Get.back();
        confirmRequestData.clear();
        confirmRequestData.add(response);
        isLoadingService(false);
      } else {
        isLoadingService(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
