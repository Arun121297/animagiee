import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homeAppBar/view/commingzoon.dart';
// import 'package:animagieeui/view/homepage/view/homepage.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../homeAppBar/view/appbar.dart';
// import '../../homeAppBar/view/notification.dart';
// import '../../homeAppBar/view/search.dart';
// import '../../profilepage/profileappbar.dart';
// import 'appoinmentavalable.dart';
// import 'dotordetails.dart';

class Doctors_List_UI extends StatefulWidget {
  const Doctors_List_UI({Key? key}) : super(key: key);

  @override
  State<Doctors_List_UI> createState() => _Doctors_List_UIState();
}

class _Doctors_List_UIState extends State<Doctors_List_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            AppbarContainer(
              title: "Doctor",
              backarrow: false,
              firstscreen: false,
              navipage: 0,
              notification: false,
              edit: false,
              search: false,
              searchfunction: true,
              searchfunctionclose: false,
              chat: false,
              notification_back_arrow: false,
              logo: false,
              podcast: false,
              fun: null,
            ),

            SizedBox(
              height: 20.0.hp,
              //  31,
            ),
            CommingZoon(),

            Text(
              textAlign: TextAlign.center,
              "We are coming soon with this\n feature...",
              style: TextStyle(
                  height: 0.2.hp,
                  color: bg_color27,
                  fontSize: 23.00.sp,
                  fontWeight: FontWeight.w600),
            )
            // SizedBox(
            //   height: MediaQuery.of(context).size.height - 189,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return Stack(alignment: Alignment.center, children: [
            //         Card(
            //           child: SizedBox(
            //             height: 14.0.hp,
            //             // 110,
            //             width: 95.0.wp,
            //             // 329,
            //             child: Row(
            //               // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Doctor_Profile_Image_UI(fetchindex: index),
            //                 const Expanded(child: SizedBox()),
            //                 Doctor_Details_UI(fetchindex: index),
            //                 const Expanded(child: SizedBox()),
            //                 Doctor_Appoinment_UI(
            //                   fetchindex: index,
            //                 ),
            //                 SizedBox(
            //                   width: 4.0.wp,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //         Visibility(
            //           visible: index == 3 ? true : false,
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.black54,
            //                 borderRadius: BorderRadius.circular(3.0.sp)),
            //             height: 14.0.hp,
            //             // 110,
            //             width: 95.0.wp,
            //             // 329,
            //           ),
            //         )
            //       ]);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
