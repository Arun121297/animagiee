import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Notification/Notification.dart';

class Notification_UI extends StatefulWidget {
  const Notification_UI({Key? key}) : super(key: key);

  @override
  State<Notification_UI> createState() => _Notification_UIState();
}

class _Notification_UIState extends State<Notification_UI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Notification_Content_Design_UI());
      },
      child: SizedBox(
        // height: 5.2.hp,
        width: 5.2.wp,
        // height: 19,
        // width: 19,
        child: Image.asset("images/notification.png"),
      ),
    );
  }
}
