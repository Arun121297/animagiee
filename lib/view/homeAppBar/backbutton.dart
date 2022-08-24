import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../homepage/homepage.dart';

class Back_Button_UI extends StatefulWidget {
  const Back_Button_UI({Key? key}) : super(key: key);

  @override
  State<Back_Button_UI> createState() => _Back_Button_UIState();
}

class _Back_Button_UIState extends State<Back_Button_UI> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: 12.0.sp,
      ),
      onPressed: () {
        // Get.to(Home_Page());
      },
    );
  }
}
