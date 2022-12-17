import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/podcast/view/podcastposttype.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
// import '../createpost/view/adddescription.dart';

import '../../createpost/view/adddescription.dart';
import '../../createpost/view/creategroup.dart';

// import '../createpost/view/postmethod.dart';

import '../../homeAppBar/view/appbar.dart';
import 'audiopodcast.dart';
import 'networktimer.dart';
import 'podcastpost.dart';

class Start_Your_Podcast_UI extends StatefulWidget {
  const Start_Your_Podcast_UI({Key? key}) : super(key: key);

  @override
  State<Start_Your_Podcast_UI> createState() => _Start_Your_Podcast_UIState();
}

class _Start_Your_Podcast_UIState extends State<Start_Your_Podcast_UI> {
  // bool passplay = false;
  Controller controller = Get.put(Controller());
  @override
  void initState() {
    controller.podcastposttype_bool = true.obs;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppbarContainer(
          backarrow: true,
          chat: false,
          logo: false,
          notification: true,
          podcast: false,
          search: false,
          notification_back_arrow: false,
          searchfunction: true,
          searchfunctionclose: false,
          edit: false,
          firstscreen: false,
          navipage: null,
          fun: Audio_Podcast_UI(),
          title: "Audio Podcast",
        ),

        // Material(
        //   elevation: 3,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     child: Row(children: [
        //       // Back_Button_UI(),
        //       Expanded(child: SizedBox()), Expanded(child: SizedBox()),
        //       Padding(
        //         padding: EdgeInsets.only(left: 30.0.sp),
        //         child: Text("Post"),
        //       ),
        //       Expanded(child: Container()),
        //       Search_UI(),
        //       Notification_UI(),
        //     ]),
        //   ),
        // ),
        // controller.cusapp("Post", context),
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
                  Podcast_Post_Method_UI(),
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
                  PodCast_Creating_Group_UI(),
                  SizedBox(height: 1.0.hp
                      //  12,
                      ),
                  SizedBox(
                    width: 97.0.wp,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [addAudio(), addImage()]),
                  ),
                  Emogie_Description_UI(),
                  // SizedBox(
                  //   height: 24,
                  // ),

                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Timer(),
                  SizedBox(
                    height: 7.0.hp,
                    //  40,
                  ),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Audio_Podcast_UI());
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
                          'Post',
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
                    // child: controller.communityNext("Post", Audio_Podcast_UI()),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    )));
  }

  addAudio() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // filepicker();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.music_note,
                  color: animagiee_CL,
                ),
                Text(
                  "Add Audio",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: descriptionText_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            //  150,
          ),
        ));
  }

  addImage() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // filepicker();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.image,
                  color: animagiee_CL,
                ),
                Text(
                  "Add Image",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: descriptionText_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            //  150,
          ),
        ));
  }
}
