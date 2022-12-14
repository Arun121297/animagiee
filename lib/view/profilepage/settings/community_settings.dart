import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../communitypage/communiti.dart';
import '../../homeAppBar/appbar.dart';
import '../../intrestpage.dart';
import 'settings.dart';

class Community_Settings_UI extends StatefulWidget {
  const Community_Settings_UI({Key? key}) : super(key: key);

  @override
  State<Community_Settings_UI> createState() => _Community_Settings_UIState();
}

class _Community_Settings_UIState extends State<Community_Settings_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarContainer(
              title: "Community Settings",
              backarrow: true,
              chat: false,
              logo: false,
              notification_back_arrow: false,
              notification: true,
              search: true,
              edit: false,
              firstscreen: false,
              navipage: null,
              searchfunction: true,
              searchfunctionclose: false,
              podcast: false,
              fun: Settings_Page_1_UI(),
            ),

            // controller.clubapp(
            //     "Community Settings", Settings_Page_1_UI(), context),
            SizedBox(
              height: 9.0.hp,
            ),
            Community_UI(),
            SizedBox(
              height: 10.0.hp,
            ),
            controller.communityNext("Save", Settings_Page_1_UI())
          ],
        ),
      ),
    );
  }
}
// Community_UI