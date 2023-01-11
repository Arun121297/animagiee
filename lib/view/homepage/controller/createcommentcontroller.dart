// import 'package:animagieeui/view/instancepage/model/user_postListModel.dart';
// import 'package:animagieeui/view/instancepage/service/user_postListservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import '../Service/commentlistservice.dart';
import '../Service/createcommend.dart';
// import '../Service/homescreen1service.dart';
// import '../model/HomeScreen1model.dart';
// import '../model/commendlistmodel.dart';
import '../model/createcommendmodel.dart';

class CreateCommentController extends GetxController {
  RxList<CreateCommendmodel> data = <CreateCommendmodel>[].obs;
  TextEditingController commenttext = TextEditingController();
  RxString commentstring = ''.obs;
  RxBool isLoadingService = true.obs;
  // RxInt currentBanner1 = 0.obs;
  createcommentcontrollerfun({postid, commandword}) async {
    isLoadingService(true);

    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
      data.clear();
      final res = await CreateCommend.createcommentservice(
          commandword: commandword, postid: postid);
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
