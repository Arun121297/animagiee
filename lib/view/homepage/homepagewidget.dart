import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../bottombarfile/bottomnavibar.dart';
import '../homeAppBar/appbar.dart';
import '../homeAppBar/chat.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/prot.dart';
import '../homeAppBar/search.dart';
import 'adminpost.dart';

import 'createpost.dart';

class Homepage_Wid extends StatelessWidget {
  const Homepage_Wid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ///appbar
              // Material(
              //   elevation: 3,
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     height: 7.0.hp,
              //     // 53.0.hp,
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 7.0.hp,
              //           child: Container(
              //             margin: EdgeInsets.only(left: 10.0.sp),
              //             width: 40.0.wp,
              //             // 122,
              //             height: 28.0.hp,
              //             child: Image.asset("images/ani.png"),
              //           ),
              //         ),
              //         Expanded(child: SizedBox()),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Search_UI(),
              //             Chat_Icon_UI(),
              //             PodCast_UI(),
              //             Notification_UI(),
              //             SizedBox(
              //               width: 4.0.wp,
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              AppbarContainer(
                title: "",
                backarrow: false,
                firstscreen: false,
                navipage: null,
                notification: true,
                edit: false,
                search: true,
                chat: true,
                logo: true,
                podcast: true,
                fun: null,
              ),

              ///createpost
              CreatePost(),

              ////adminpost
              Admin_Post()
            ],
          ),
        ),
      ),
    );
  }
}
