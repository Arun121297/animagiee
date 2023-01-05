import 'package:animagieeui/config/extension.dart';
// import 'package:animagieeui/view/instancepage/view/communiti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
// import 'communitypage/view/communiti.dart';
import '../../communitypage/view/communiti.dart';
import '../../homepage/view/homepage.dart';
import '../controller/instancecontroller.dart';
import '../controller/updateinstancecontroller.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  UpdataInstanceController updataInstanceController =
      Get.put(UpdataInstanceController());
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  clear() {
    controller.Fbemail.value = '';
    controller.email.value = '';
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await instanceContoroller.instancecontroller();
    });
  }

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (instanceContoroller.instancescreenloadingindicator.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (instanceContoroller.getinstancedata.isEmpty) {
          return const Center(child: Text("No Communities"));
        } else {
          return WillPopScope(
            onWillPop: () {
              return clear();
            },
            child: SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              "Welcome !",
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Expanded(child: Container()),
                        /*  SKIP OPTION */
                        /*  GestureDetector(
                          onTap: () {
                            Get.to(Home_Page());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            alignment: Alignment.center,
                            width: 22.0.wp,
                            //  80,
                            height: 4.0.hp,
                            //  35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              color: animagiee_CL,
                            ),
                            child: Text(
                              "Skip",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: skip_CL,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                     */
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 85, top: 3),
                      child: Text(
                        "Let us know what you’re interested in",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.0.sp,
                            color: dummycontent_Cl,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 30.0.hp,
                      //  255,
                      width: 65.0.wp,
                      // 255,
                      child: Image.asset("images/Curious.gif"),
                    ),
                    const Community_UI(),
                    SizedBox(
                      height: 3.0.hp,
                      //  30,
                    ),
                    // GestureDetector(
                    //   onTap: () => commuities(),
                    //   // setState(() {});
                    //   // },
                    //   child: Container(
                    //     height: 43,
                    //     width: 310,
                    //     decoration: BoxDecoration(
                    //         color: buttonColor1_CL,
                    //         borderRadius: BorderRadius.circular(15)),
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       'Next',
                    //       style: GoogleFonts.poppins(
                    //         textStyle: const TextStyle(
                    //           fontSize: 18,
                    //           color: SigninButton_CL,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
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
                    ),
                    // controller.communityNext("Next", commuities())
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
    Get.to(Home_Page());
  }
}
