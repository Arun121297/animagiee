// singlePostProfile
import 'dart:developer';

import 'package:get/get.dart';

import '../model/singlepostmodel.dart';
import '../service/singlepostservice.dart';

class SinglepostController extends GetxController {
  RxList<Datum> singlepostlist = <Datum>[].obs;
  // RxBool singlepostloadingindicator = true.obs;
  var clint = SinglePostProfileSevice();
  var follow = false.obs;
  RxBool nullData = true.obs;
  var save = false.obs;
  RxBool isLoginUser = false.obs;
  var message = ''.obs;
  var myProfile = ''.obs;
  var id = ''.obs;
  var likeCount = 0.obs;
  bool like = false;
  Future singlepostcontroller(id) async {
    try {
      // if (id != '') {
      var data =
          // = singlepostloadingindicator.value
          // ?
          await clint.singlePostProfile(id: id);
      // : await SinglePostServices().unAuthGetData(postId: postId);

      if (data != null) {
        // if (data.data!.isNotEmpty) {
        singlepostlist.value.clear();
        // singlepostlist.value = data.data!;
        singlepostlist.value = (data.data!);
        like = singlepostlist[0].liked!;
        // follow.value = singlepostlist[0].;
        likeCount(singlepostlist[0].likecount);
        // challengeStatus(listData[0].challengeAcceptedPersons);
        save(singlepostlist[0].saved);
        nullData(false);
      }
      // else {
      //   nullData(false);
      //   // message.value = data!.message!;
      // }
      // nullData(false);
      // }
      //  else {
      //   nullData(false);
      // }
      // }
      else {
        // ToastView.toast('somthing went wrong');
        nullData(false);
      }
    } catch (e) {
      log("e$e");
      rethrow;
    }
    // try {
    //   var response;
    //   response = await clint.singlePostProfile(id);
    //   if (response != null) {
    //     singlepostlist.clear();
    //     singlepostlist.add(response);
    //     singlepostloadingindicator(false);
    //     // Get.back();
    //   } else {
    //     singlepostloadingindicator(false);

    //     return null;
    //   }
    // } catch (e) {
    //   print("e$e");
    //   rethrow;
    // }
  }
}
