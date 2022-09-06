import 'package:animagieeui/view/podcast/suggestedpodcast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/controller.dart';

import 'audiopodcast.dart';
import 'dogsmusicplay.dart';

class View_All_Suggested_List_UI extends StatefulWidget {
  const View_All_Suggested_List_UI({Key? key}) : super(key: key);

  @override
  State<View_All_Suggested_List_UI> createState() =>
      _View_All_Suggested_List_UIState();
}

class _View_All_Suggested_List_UIState
    extends State<View_All_Suggested_List_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() {
          return Visibility(
              visible: controller.podcastplayblutton.value,
              child: Playing_Music_UI());
        }),
        body: SafeArea(
          child: Column(
            children: [
              controller.podcastapp(
                  "Audio Podcast", Audio_Podcast_UI(), context),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 140,
                      width: MediaQuery.of(context).size.width,
                      child: Suggested_PodCast_UI(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //  Expanded(
          //   child: SingleChildScrollView(
          //     child:
          //     SizedBox(
          //   child: Column(
          //     children: [
          //       PodCast_AppBar_UI(),
          //       Expanded(
          //         child: SingleChildScrollView(
          //             child: SizedBox(
          //                 child:
          //                     //  Suggested_PodCast_UI()
          //                     ListView.separated(
          //           separatorBuilder: (context, index) {
          //             return SizedBox(
          //               height: 10,
          //             );
          //           },
          //           scrollDirection: Axis.vertical,
          //           itemCount: 10,
          //           shrinkWrap: true,
          //           itemBuilder: (context, index) => Container(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 SizedBox(
          //                   width: 5,
          //                 ),
          //                 Container(
          //                   height: 70,
          //                   width: 65,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       image: DecorationImage(
          //                         image: AssetImage(
          //                           "images/podcastdog.png",
          //                         ),
          //                       )),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       "Doggiee song",
          //                       style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(
          //                           fontSize: 8.5.sp,
          //                           // color: Colors.black,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                     Text(
          //                       "4:20",
          //                       style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(
          //                           fontSize: 7.5.sp,
          //                           color: Colors.blueGrey,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     setState(() {
          //                       if (controller.podcastplayblutton.value == true) {
          //                         controller.podcastplayblutton.value = false;
          //                       } else {
          //                         controller.podcastplayblutton.value = true;
          //                       }
          //                     });
          //                   },
          //                   child: Container(
          //                     // color: Colors.purple,
          //                     height: 35,
          //                     width: 180,
          //                     alignment: Alignment.centerRight,
          //                     child: Image.asset(
          //                       "images/play.png",
          //                       cacheHeight: 35,
          //                       cacheWidth: 119,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //             height: 76,
          //             width: MediaQuery.of(context).size.width,
          //             color: podcastcolor_1_CL,
          //           ),
          //         ))),
          //       ),
          //     ],
          //   ),
          // ),
          //   ),
          // ),
        ));
  }
}
