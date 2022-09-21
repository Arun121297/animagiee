import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Notification/Notification.dart';

class Notification_UI extends StatelessWidget {
  const Notification_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Notification_Content_Design_UI());
      },
      child: SizedBox(
        // height: 5.2.hp,
        width: 5.2.wp,

        child: Image.asset("images/notification.png"),
      ),
    );
  }
}
