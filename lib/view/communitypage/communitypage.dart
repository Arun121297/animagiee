import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import '../homepage/adminpost.dart';
import 'communiti.dart';
import '../homepage/homepage.dart';
import 'clubs/myclubs.dart';

class Community_Page_UI extends StatefulWidget {
  const Community_Page_UI({Key? key}) : super(key: key);

  @override
  State<Community_Page_UI> createState() => _Community_Page_UIState();
}

class _Community_Page_UIState extends State<Community_Page_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Material(
                elevation: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    // Back_Button_UI(),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.arrow_back_ios_new,
                    //     size: 12.0.sp,
                    //   ),
                    //   onPressed: () {
                    //     Get.to(Home_Page());
                    //   },
                    // ),
                    Expanded(child: SizedBox()),
                    Expanded(child: SizedBox()),

                    Padding(
                      padding: EdgeInsets.only(left: 30.0.sp),
                      child: Text("Communities"),
                    ),
                    Expanded(child: Container()),
                    Search_UI(),
                    Notification_UI(),
                  ]),
                ),
              ),
              // controller.cusapp("Communities", context),
              Row(
                children: [],
              ),
              SizedBox(height: 3.0.hp
                  //  38,
                  ),
              Community_UI(),
              SizedBox(height: 14.0.hp
                  // 119,
                  ),
              controller.communityNext("Next", MyClubs_UI()),
              // GestureDetector(
              //   onTap: () {
              //     Get.to(MyClubs_UI());
              //   },
              //   child: Container(
              //     height: 6.0.hp,
              //     // 43,
              //     width: 90.0.wp,
              //     // 310,
              //     decoration: BoxDecoration(
              //         color: buttonColor1_CL,
              //         borderRadius: BorderRadius.circular(15)),
              //     alignment: Alignment.center,
              //     child: Text(
              //       "Next",
              //       style: GoogleFonts.poppins(
              //         textStyle: TextStyle(
              //           fontSize: 17.0.sp,
              //           color: SigninButton_CL,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              // controller.communityNext(MyClubs_UI())
            ],
          ),
        ),
      ),
    );
  }
}
