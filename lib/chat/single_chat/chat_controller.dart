import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var isEmojiVisible = false.obs;
  // FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textEditingController.dispose();
  }
}
