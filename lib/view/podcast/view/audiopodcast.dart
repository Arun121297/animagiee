import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homeAppBar/view/appbar.dart';

import 'package:animagieeui/view/homepage/view/homepage.dart';

import 'package:animagieeui/view/podcast/view/startpodcast.dart';
// import 'package:animagieeui/view/podcast/suggestedpodcast.dart';
import 'package:animagieeui/view/podcast/view/suggestedpodcast.dart';
import 'package:animagieeui/view/podcast/view/topcollection.dart';
import 'package:animagieeui/view/podcast/view/viewallsuggestion.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

import '../../homeAppBar/view/commingzoon.dart';
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
          child: Playing_Music_UI(),
        );
      }),
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PodCast_AppBar_UI(),
          AppbarContainer(
            title: "Audio Podcast",
            logo: false,
            notification: true,
            search: false,
            backarrow: true,
            notification_back_arrow: false,
            podcast: false,
            searchfunction: true,
            searchfunctionclose: false,
            chat: false,
            edit: false,
            firstscreen: false,
            navipage: null,
            fun: Home_Page(),
          ),
          SizedBox(
            height: 25.0.hp,
          ),
          const CommingZoon()
          // Expanded(
          //     child: SingleChildScrollView(
          //         child: SizedBox(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(15.0.sp),
          //         child: Text(
          //           "Dog fanzz group...",
          //           style: GoogleFonts.poppins(
          //             textStyle: TextStyle(
          //               fontSize: 10.5.sp,
          //               color: Colors.black,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         // width: 270,
          //         margin: EdgeInsets.only(
          //           left: 15.0.sp,
          //         ),
          //         child: Text(
          //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \nLorem Ipsum has been the industry's standard ",
          //           maxLines: 2,
          //           style: GoogleFonts.poppins(
          //             textStyle: TextStyle(
          //               fontSize: 9.5.sp,
          //               color: Colors.black,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 26.0.hp,
          //         // 196,
          //         width: MediaQuery.of(context).size.width,
          //         alignment: Alignment.center,
          //         child: CarouselSlider.builder(
          //           itemCount: 4,
          //           options: CarouselOptions(
          //             reverse: false,
          //             viewportFraction: 1,
          //             enableInfiniteScroll: false,
          //           ),
          //           itemBuilder: (context, index, realIndex) {
          //             return Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: SizedBox(
          //                 width: MediaQuery.of(context).size.width,
          //                 height: 26.0.hp,
          //                 child: Image.asset("images/podcastimage.png"),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 10.0.sp),
          //         width: MediaQuery.of(context).size.width,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Container(
          //                 width: 80.0.wp,
          //                 //  280,
          //                 // color: Colors.greenAccent,
          //                 child: Text(
          //                   "Suggested for You",
          //                   style: GoogleFonts.poppins(
          //                     textStyle: TextStyle(
          //                       fontSize: 9.5.sp,
          //                       // color: Colors.black,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                 )),
          //             GestureDetector(
          //               onTap: () {
          //                 Get.to(View_All_Suggested_List_UI());
          //               },
          //               child: Container(
          //                   // color: animagiee_CL,
          //                   child: Text(
          //                 "View all",
          //                 style: GoogleFonts.poppins(
          //                   textStyle: TextStyle(
          //                     fontSize: 8.5.sp,
          //                     // color: Colors.black,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               )),
          //             )
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(top: 10.0.sp),
          //         child: SizedBox(
          //             height: 18.0.hp,
          //             // 170,
          //             width: MediaQuery.of(context).size.width,
          //             child: Column(
          //               children: [
          //                 Suggested_PodCast_UI(),
          //                 SizedBox(
          //                   height: 1.0.hp,
          //                 ),
          //                 Suggested_PodCast_UI(),
          //               ],
          //             )),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 18.0, top: 10),
          //         child: Text(
          //           "Top Collections",
          //           style: GoogleFonts.poppins(
          //             textStyle: TextStyle(
          //               fontSize: 9.5.sp,
          //               color: Colors.black,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //           height: 18.0.hp,
          //           //  120,
          //           width: MediaQuery.of(context).size.width,
          //           child: Top_Collection_Podcast_UI()),
          //       SizedBox(
          //         height: 3.0.hp,
          //         //  30,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(Start_Your_Podcast_UI());
          //         },
          //         child: Align(
          //           alignment: Alignment.center,
          //           child: Container(
          //             height: 6.0.hp,
          //             // 46,
          //             width: 70.0.wp,
          //             // 236,
          //             decoration: BoxDecoration(
          //                 color: animagiee_CL,
          //                 borderRadius: BorderRadius.circular(10)),
          //             // alignment: Alignment.center,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Start your podcast",
          //                   style: GoogleFonts.poppins(
          //                     textStyle: TextStyle(
          //                       fontSize: 11.0.sp,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 12.0.wp,
          //                   //  40,
          //                 ),
          //                 CircleAvatar(
          //                     radius: 15,
          //                     backgroundColor: Colors.black,
          //                     child: Icon(
          //                       Icons.mic_rounded,
          //                       size: 20,
          //                       color: Colors.white,
          //                     ))
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 3.0.wp,
          //         //  20,
          //       )
          //     ],
          //   ),
          // )))
        ],
      )),
    );
  }
}
