import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/controller.dart';
import '../../../../../data/pages.dart';

class Home_Page extends StatelessWidget {
  Home_Page({Key? key}) : super(key: key);

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // bottomNavigationBar: Customized_Bottom_Bar(),
        // body:
        Obx(
      () => wid[controller.selectedIndex.value],
      // ),
    );
  }
}
