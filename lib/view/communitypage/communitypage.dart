import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/controller.dart';

import '../../data/pages.dart';
import '../bottombarfile/bottomnavibar.dart';
import '../homeAppBar/appbar.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import '../profilepage/profileappbar.dart';
import 'communiti.dart';

import 'clubs/myclubs.dart';

class Community_Page_UI extends StatefulWidget {
  Community_Page_UI({Key? key}) : super(key: key);

  @override
  State<Community_Page_UI> createState() => _Community_Page_UIState();
}

class _Community_Page_UIState extends State<Community_Page_UI> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Communitiefrontscreen(),
              AppbarContainer(
                title: "Communities",
                backarrow: false,
                firstscreen: true,
                navipage: 0,
                notification_back_arrow: false,
                notification: true,
                edit: false,
                search: true,
                chat: false,
                logo: false,
                podcast: false,
                fun: null,
              ),
              // Profile_AppBar_UI(
              //     edit: false,
              //     notification: true,
              //     navipage: 0,
              //     title: "Communities"),
              // controller.clubapp(
              //     "Communities",
              //     // null,
              //     navigate(),
              //     // Home_Page(),
              //     context),
              SizedBox(height: 3.0.hp),
              Community_UI(),
              SizedBox(height: 14.0.hp),
              controller.communityNext("Next", MyClubs_UI()),
            ],
          ),
        ),
      ),
    );
  }

  // Communitiefrontscreen() {
  //   return Material(
  //     elevation: 3,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Row(children: [
  //         IconButton(
  //           icon: Icon(
  //             Icons.arrow_back_ios_new,
  //             size: 12.0.sp,
  //           ),
  //           onPressed: () {
  //             controller.selectedIndex.value = 0;
  //             // Get.to(fun);
  //           },
  //         ),
  //         Expanded(child: SizedBox()),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 30.0),
  //           child: Text(
  //             "Communities",
  //             style: GoogleFonts.poppins(
  //               textStyle: TextStyle(
  //                 fontSize: 10.5.sp,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(child: Container()),
  //         Search_UI(),
  //         Notification_UI(),
  //         SizedBox(
  //           width: 3.0.wp,
  //         )
  //       ]),
  //     ),
  //   );
  // }
}
