import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/controller.dart';
import '../homeAppBar/appbar.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import '../profilepage/profileappbar.dart';
import 'appoinmentavalable.dart';
import 'doctorprofilephoto.dart';
import 'dotordetails.dart';

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
              firstscreen: true,
              navipage: 0,
              notification: true,
              edit: false,
              search: true,
              chat: false,
              logo: false,
              podcast: false,
              fun: null,
            ),
            // Profile_AppBar_UI(
            //     edit: false, notification: true, navipage: 0, title: "Doctor"),
            // Doctorfrontscreen(),
            // controller.clubapp("Doctor", Home_Page(), context),
            SizedBox(
              height: 3.0.hp,
              //  31,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 189,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(alignment: Alignment.center, children: [
                    Card(
                      child: Container(
                        height: 14.0.hp,
                        // 110,
                        width: 95.0.wp,
                        // 329,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Doctor_Profile_Image_UI(fetchindex: index),
                            Expanded(child: SizedBox()),
                            Doctor_Details_UI(fetchindex: index),
                            Expanded(child: SizedBox()),
                            Doctor_Appoinment_UI(
                              fetchindex: index,
                            ),
                            SizedBox(
                              width: 4.0.wp,
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 3 ? true : false,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(3.0.sp)),
                        height: 14.0.hp,
                        // 110,
                        width: 95.0.wp,
                        // 329,
                      ),
                    )
                  ]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Doctorfrontscreen() {
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
  //             "Doctor",
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
