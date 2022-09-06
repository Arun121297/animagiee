import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';

import 'package:animagieeui/view/homepage/homepage.dart';

import 'package:animagieeui/view/podcast/startpodcast.dart';
import 'package:animagieeui/view/podcast/suggestedpodcast.dart';
import 'package:animagieeui/view/podcast/topcollection.dart';
import 'package:animagieeui/view/podcast/viewallsuggestion.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

import 'dogsmusicplay.dart';

class Audio_Podcast_UI extends StatefulWidget {
  const Audio_Podcast_UI({Key? key}) : super(key: key);

  @override
  State<Audio_Podcast_UI> createState() => _Audio_Podcast_UIState();
}

class _Audio_Podcast_UIState extends State<Audio_Podcast_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Visibility(
            visible: controller.podcastplayblutton.value,
            child: Playing_Music_UI());
      }),
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PodCast_AppBar_UI(),
          controller.podcastapp("Audio Podcast", Home_Page(), context),
          Expanded(
              child: SingleChildScrollView(
                  child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Dog fanzz group...",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  // width: 270,
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \nLorem Ipsum has been the industry's standard ",
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 26.0.hp,
                  // 196,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Image.asset("images/podcastimage.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 80.0.wp,
                          //  280,
                          // color: Colors.greenAccent,
                          child: Text(
                            "Suggested for You",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.5.sp,
                                // color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.to(View_All_Suggested_List_UI());
                        },
                        child: Container(
                            // color: animagiee_CL,
                            child: Text(
                          "View all",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.5.sp,
                              // color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 22.0.hp,
                    // 170,
                    width: MediaQuery.of(context).size.width,
                    child: Suggested_PodCast_UI(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    "Top Collections",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 18.0.hp,
                    //  120,
                    width: MediaQuery.of(context).size.width,
                    child: Top_Collection_Podcast_UI()),
                SizedBox(
                  height: 5.0.hp,
                  //  30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Start_Your_Podcast_UI());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6.0.hp,
                      // 46,
                      width: 70.0.wp,
                      // 236,
                      decoration: BoxDecoration(
                          color: animagiee_CL,
                          borderRadius: BorderRadius.circular(10)),
                      // alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Start your podcast",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.0.wp,
                            //  40,
                          ),
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.mic_rounded,
                                size: 20,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )))
        ],
      )),
    );
  }
}
