import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/profilepage/view/settings/private&security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../homeAppBar/view/appbar.dart';
import 'about.dart';
import 'community_settings.dart';

class Settings_Page_1_UI extends StatefulWidget {
  const Settings_Page_1_UI({Key? key}) : super(key: key);

  @override
  State<Settings_Page_1_UI> createState() => _Settings_Page_1_UIState();
}

class _Settings_Page_1_UIState extends State<Settings_Page_1_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        children: [
          AppbarContainer(
            title: "Settings",
            backarrow: true,
            chat: false,
            logo: false,
            edit: false,
            firstscreen: false,
            navipage: null,
            podcast: false,
            searchfunction: true,
            searchfunctionclose: false,
            notification: false,
            notification_back_arrow: false,
            search: false,
            fun: Home_Page(),
          ),

          // controller.clubapp("Settings", Home_Page(), context),
          SizedBox(
            height: 3.0.hp,
            //  41,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Private_Security_Design_UI());
            },
            child: Container(
              height: 6.0.hp,
              // 46,
              width: 90.0.wp,
              // 330,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0.wp,
                  ),
                  Icon(
                    Icons.security,
                    color: animagiee_CL,
                  ),
                  SizedBox(
                    width: 7.0.wp,
                  ),
                  Container(
                    // color: Colors.green,
                    child: Text(
                      "Privacy & Security",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: boxcolor_CL,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: 3.0.hp,
            //  25,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Community_Settings_UI());
            },
            child: Container(
              height: 6.0.hp,
              // 46,
              width: 90.0.wp,
              // 330,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0.wp,
                  ),
                  SizedBox(
                    height: 6.0.hp,
                    //  17,
                    width: 7.0.wp,
                    //  21,
                    child: Image.asset(
                      "images/communitygroupsetting.png",
                      // cacheHeight: 17,
                      // cacheWidth: 21,
                      color: animagiee_CL,
                    ),
                  ),
                  SizedBox(
                    width: 7.0.wp,
                  ),
                  Container(
                    // color: Colors.green,
                    child: Text(
                      "Community Settings",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: boxcolor_CL,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: 3.0.hp,
            //  25,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Scaffold(
                body: About_Design_UI(),
              ));
            },
            child: Container(
              height: 6.0.hp,
              // 46,
              width: 90.0.wp,
              // 330,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0.wp,
                  ),
                  SizedBox(
                    height: 4.0.hp,
                    // 18,
                    width: 5.0.wp,
                    //  18,
                    child: Image.asset(
                      "images/about.png",
                      // cacheHeight: 18,
                      // cacheWidth: 18,
                      color: animagiee_CL,
                    ),
                  ),

                  Container(
                    width: 30.0.wp,
                    // 95,
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Text(
                      "About",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 2,
                  // ),
                ],
              ),
              decoration: BoxDecoration(
                  color: boxcolor_CL,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: 3.0.hp,
            //  25,
          ),
          Container(
            height: 6.0.hp,
            // 46,
            width: 90.0.wp,
            // 330,
            child: Row(
              children: [
                SizedBox(
                  width: 10.0.wp,
                ),
                Icon(
                  Icons.help,
                  color: animagiee_CL,
                ),
                SizedBox(
                  width: 4.0.wp,
                ),
                Container(
                  width: 30.0.wp, //  95,
                  alignment: Alignment.center,
                  // color: Colors.green,
                  child: Text(
                    "Help / Report",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.5.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: boxcolor_CL,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.grey)),
          ),
        ],
      ),
    )));
  }
}
