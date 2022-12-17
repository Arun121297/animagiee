import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/communitypage/view/communiti.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:animagieeui/view/instancepage/controller/updateinstancecontroller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

import '../../../data/pages.dart';
import '../../bottombarfile/view/bottomnavibar.dart';
// import '../../bottombarfile/view/bottomnavibar.dart';
import '../../homeAppBar/view/appbar.dart';
import '../../homeAppBar/view/notification.dart';
import '../../homeAppBar/view/search.dart';
import '../../profilepage/view/profileappbar.dart';
// import '../../instancepage/view/communiti.dart';
// import 'communiti.dart';

import 'clubs/myclubs.dart';
// import 'communitieslist.dart';

class Community_Page_UI extends StatefulWidget {
  Community_Page_UI({Key? key}) : super(key: key);

  @override
  State<Community_Page_UI> createState() => _Community_Page_UIState();
}

class _Community_Page_UIState extends State<Community_Page_UI> {
  Controller controller = Get.put(Controller());
  UpdataInstanceController updataInstanceController =
      Get.put(UpdataInstanceController());
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: Obx(() {
        if (instanceContoroller.instancescreenloadingindicator.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (instanceContoroller.getinstancedata.isEmpty) {
          return Center(
            child: Text("no Communities"),
          );
        } else {
          return WillPopScope(
            onWillPop: () {
              return null!;
            },
            child: SafeArea(
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
                      searchfunction: true,
                      searchfunctionclose: false,
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
                    // Communitieslist(),
                    SizedBox(height: 14.0.hp),
                    GestureDetector(
                      onTap: () {
                        commuities();
                        // Get.to(fun);
                      },
                      child: Container(
                        height: 43,
                        width: 310,
                        decoration: BoxDecoration(
                            color: buttonColor1_CL,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: SigninButton_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  commuities() {
    // var id = instanceContoroller.communitylist
    //     .map((item) => item)
    //     .toList()
    //     .join(",");
    // log("List-->${instanceContoroller.communitylist}");
    // log("id-->$id");
    updataInstanceController
        .updateinstancecontroller(instanceContoroller.communitylist);
    Get.to(const MyClubs_UI());
    // Get.to(Home_Page());
  }
}