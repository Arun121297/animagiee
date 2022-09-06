import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:animagieeui/view/createpost/post.dart';
import 'package:animagieeui/view/createpost/postmethod.dart';
import 'package:animagieeui/view/createpost/tagpeople.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/pages.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
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
    // print("print:::${a}");
    // TODO: implement initState
    super.initState();
  }

  Controller controller = Get.put(Controller());
  bool posttype_bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  // Back_Button_UI(),
                  Expanded(child: SizedBox()), Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0.sp),
                    child: Text("Post"),
                  ),
                  Expanded(child: Container()),
                  Search_UI(),
                  Notification_UI(),
                ]),
              ),
            ),
            // controller.cusapp("Post", context),
            SizedBox(
              height: 2.0.hp,
              //  22,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.sp),
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
                      padding: EdgeInsets.only(left: 20.0.sp),
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
                        visible: controller.file.path.isEmpty ? false : true,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Obx(() {
                              if (controller.imagevideo.value.type == "image") {
                                return Container(
                                  height: 20.0.hp,
                                  //  134,
                                  width: 95.0.wp,
                                  // 339,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          // AssetImage(
                                          //     controller.imagevideo.value.url.)
                                          FileImage(
                                              // File(controller.file.path),
                                              File(controller
                                                  .imagevideo.value.url
                                                  .toString())),
                                    ),
                                    borderRadius: BorderRadius.circular(8.0.sp),
                                    border: Border.all(
                                        width: 2, color: animagiee_CL),
                                  ),
                                );
                              } else {
                                return Video_Player(
                                  urls: controller.imagevideo.value.url
                                      .toString(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Add_Photos_UI(), Add_Video_UI()],
                    ),

                    Tag_People_UI(),
                    Post_Button_UI(),
                    SizedBox(height: 2.5.sp
                        // 10,
                        )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
