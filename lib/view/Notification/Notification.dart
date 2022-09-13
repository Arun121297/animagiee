import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notificationappbar.dart';

class Notification_Content_Design_UI extends StatefulWidget {
  const Notification_Content_Design_UI({Key? key}) : super(key: key);

  @override
  State<Notification_Content_Design_UI> createState() =>
      _Notification_Content_Design_UIState();
}

class _Notification_Content_Design_UIState
    extends State<Notification_Content_Design_UI> {
  Controller controller = Get.put(Controller());
  bool follow_request_accecpt = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Notification_AppBar_UI(
              title: "Notification",
            ),
            Expanded(
                child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0.sp, top: 24.0.sp),
                      height: 4.0.hp,
                      // 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommend notification",
                          // textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.5.sp,
                              color: animagiee_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),

                    ///Notification
                    SizedBox(
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recommended for you",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 9.5.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and ...",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 7.5.sp,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // popup();
                                      });
                                    },
                                  ),
                                ],
                              ),

                              // ListTile(
                              //   leading: CircleAvatar(),
                              //   title: Text(
                              //     "Recommended for you",
                              //     style: GoogleFonts.poppins(
                              //       textStyle: TextStyle(
                              //         fontSize: 9.5.sp,
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ),
                              //   trailing: IconButton(
                              //     icon: Icon(Icons.more_horiz),
                              //     onPressed: () {
                              //       setState(() {
                              //         popup();
                              //       });
                              //     },
                              //   ),
                              //   subtitle: Text(
                              //     "Lorem Ipsum is simply dummy text of the printing and ...",
                              //     style: GoogleFonts.poppins(
                              //       textStyle: TextStyle(
                              //         fontSize: 7.5.sp,
                              //         color: Colors.grey,
                              //         fontWeight: FontWeight.w400,
                              //       ),
                              //     ),
                              //     maxLines: 1,
                              //   ),
                              // ),
                              Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Colors.grey,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    ////Visible Doctor profile
                    SizedBox(
                      height: 15.0.hp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Transform.rotate(
                              angle: 20.4,
                              child: Icon(
                                Icons.pets,
                                color: animagiee_CL,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60.0.wp,
                            //  240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Documents approval status"),
                                Text(
                                  "Your Documents have been approved successfull and has been verified.You can activate your Doctor module by clicking\non the activate button given below..",
                                  maxLines: 3,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 6.5.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.profilechangebool(true);
                                      controller.appoinmentdetailshide(false);
                                    });
                                  },
                                  child: Container(
                                    height: 5.0.hp,
                                    // 31,
                                    width: 30.0.wp,
                                    //  100,
                                    alignment: Alignment.center,

                                    child: Text(
                                      controller.profilechangebool.value ==
                                              false
                                          ? "Activate"
                                          : "DeActivate",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: controller.profilechangebool
                                                      .value ==
                                                  false
                                              ? animagiee_CL
                                              : notificationContent1_CL,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0.sp),
                                        color: controller
                                                    .profilechangebool.value ==
                                                false
                                            ? notificationContent1_CL
                                            : animagiee_CL),
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )),
                          // SizedBox(width: 2,)
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    ),

                    ////Friend Request
                    SizedBox(
                      height: 12.0.hp,
                      //  80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Nina ann"),
                              Text(
                                "Nina ann Requested to follow you",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 6.5.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        follow_request_accecpt = false;
                                      });
                                    },
                                    child: Container(
                                      height: 4.0.hp,
                                      // 31,
                                      width: 27.0.wp,
                                      //  100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        follow_request_accecpt == false
                                            ? "Accecpted"
                                            : "Accept",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 9.5.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: animagiee_CL),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Visibility(
                                    visible: follow_request_accecpt,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 4.0.hp,
                                        // 31,
                                        width: 27.0.wp,
                                        //  100,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Deny",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 9.5.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: animagiee_CL),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }

//  Container(
//                         height: 90,
//                         width: 90,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(child: SizedBox()),
//                             Text(
//                               "Delete",
//                               style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                   fontSize: 8.0.sp,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Divider(
//                               endIndent: 10,
//                               // indent: 5,
//                               color: Colors.grey,
//                               thickness: 1,
//                             ),
//                             Text(
//                               "Mute Notifcations",
//                               style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                   fontSize: 8.0.sp,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: SizedBox()),
//                           ],
//                         ),
//                       ),
}
