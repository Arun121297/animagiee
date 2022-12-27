import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Service/homecreatepostservice.dart';

class HomescreenCreatePost extends GetxController {
  File filepick = File('');
  Rx<PostFilepickerType> imagevideo =
      PostFilepickerType(type: "", url: File('')).obs;
  RxBool isLoadingService = true.obs;
  TextEditingController description = TextEditingController();
  var clint = HomeScreenCreateIndividualPost();
  individualpost() async {
    final res = await clint.createindividualpost(
        posttype: imagevideo.value.type,
        addimageorvideo: filepick.path,
        description: description.text);

    if (res != null) {
      isLoadingService(false);
    } else {
      isLoadingService(false);
    }
  }
}

class PostFilepickerType {
  String? type;
  File? url;
  PostFilepickerType({this.type, this.url});
}
