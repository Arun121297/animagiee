import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';

import 'package:animagieeui/view/createpost/postmethod.dart';
import 'package:animagieeui/view/createpost/tagpeople.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottombarfile/bottomnavibar.dart';
import '../homeAppBar/appbar.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import '../profilepage/profileappbar.dart';
import 'adddescription.dart';
import 'addphotos.dart';
import 'addvideos.dart';
import 'creategroup.dart';
import 'videoplayer.dart';

class UserProfile_CreatePost_UI extends StatefulWidget {
  UserProfile_CreatePost_UI({Key? key}) : super(key: key);

  @override
  State<UserProfile_CreatePost_UI> createState() =>
      _UserProfile_CreatePost_UIState();
}

class _UserProfile_CreatePost_UIState extends State<UserProfile_CreatePost_UI> {
  @override
  void initState() {
    controller.posttype_bool = true.obs;
    // TODO: implement initState
    super.initState();
  }

  Controller controller = Get.put(Controller());
  bool posttype_bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: WillPopScope(
        onWillPop: () {
          return null!;
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarContainer(
                title: "Post",
                backarrow: false,
                firstscreen: true,
                navipage: 0,
                notification_back_arrow: false,
                notification: true,
                edit: false,
                search: true,
                searchfunction: true,
                searchfunctionclose: false,
                chat: false,
                logo: false,
                podcast: false,
                fun: null,
              ),
              // Profile_AppBar_UI(
              //     edit: false, notification: true, navipage: 0, title: "Post"),
              // Postfrontscreen(),
              // controller.clubapp("Post", Home_Page(), context),
              SizedBox(
                height: 2.0.hp,
                //  22,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.0.sp),
                          child: Text(
                            "Post Type",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0.sp
                            // 12,
                            ),
                        Post_Method_UI(),
                        SizedBox(height: 8.0.wp
                            // 24,
                            ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.sp),
                          child: Text(
                            "Select group",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.hp
                            //  12,
                            ),
                        Create_Post_UI(),
                        SizedBox(height: 1.0.hp
                            //  12,
                            ),
                        Emogie_Description_UI(),
                        // SizedBox(
                        //   height: 24,
                        // ),
                        Align(
                          alignment: Alignment.center,
                          child: Visibility(
                            visible:
                                controller.file.path.isEmpty ? false : true,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Obx(() {
                                  if (controller.imagevideo.value.type ==
                                      "image") {
                                    return Container(
                                      height: 20.0.hp,
                                      //  134,
                                      width: 93.0.wp,
                                      // 339,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(File(controller
                                              .imagevideo.value.url
                                              .toString())),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0.sp),
                                        border: Border.all(
                                            width: 2, color: animagiee_CL),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      height: 20.0.hp,
                                      //  134,
                                      width: 93.0.wp,
                                      // 339,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0.sp),
                                        border: Border.all(
                                            width: 2, color: animagiee_CL),
                                      ),
                                      child: Video_Player(
                                        urls: controller.imagevideo.value.url
                                            .toString(),
                                      ),
                                    );
                                  }
                                })
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        SizedBox(
                          width: 97.0.wp,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Add_Photos_UI(), Add_Video_UI()]),
                        ),

                        Tag_People_UI(),
                        SizedBox(
                          height: 3.0.hp,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = 0;
                            },
                            child: Container(
                              height: 6.0.hp,
                              width: 90.0.wp,
                              // 310,
                              decoration: BoxDecoration(
                                  color: buttonColor1_CL,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text(
                                "Post",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: SigninButton_CL,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 2.5.sp)
                        // 10,
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  // Postfrontscreen() {
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
  //             "Post",
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
