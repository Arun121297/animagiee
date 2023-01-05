import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homeAppBar/view/appbar.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../userprofile/view/userprofile.dart';
import 'notificationlist.dart';

class Notification_Content_Design_UI extends StatefulWidget {
  const Notification_Content_Design_UI({Key? key}) : super(key: key);

  @override
  State<Notification_Content_Design_UI> createState() =>
      _Notification_Content_Design_UIState();
}

class _Notification_Content_Design_UIState
    extends State<Notification_Content_Design_UI> {
  Controller controller = Get.put(Controller());
  ScrollController scrollController = ScrollController();
  // bool follow_request_accecpt = true;
  var follow_request_accecpt = 0;
  var onItem;
  var followrequest = "Accept";
  popupnotification() {
    Get.to(Home_Page());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarContainer(
                title: "Notification",
                logo: false,
                notification: false,
                notification_back_arrow: true,
                search: true,
                backarrow: false,
                podcast: false,
                edit: false,
                firstscreen: false,
                fun: null,
                navipage: null,
                searchfunction: true,
                searchfunctionclose: false,
                chat: false),
            Expanded(
                child: SingleChildScrollView(
              controller: scrollController,
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
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          controller: scrollController,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // onItem = index;

                                  controller.visible.value = false;
                                });
                              },
                              child: Notification_content_List(
                                  fetchindex: index,
                                  onItem: onItem,
                                  onpress: () {
                                    setState(() {
                                      onItem = index;

                                      controller.visible.value =
                                          !controller.visible.value;
                                    });
                                  }),
                            );
                          }),
                    ),
                    ////Visible Doctor profile
                    SizedBox(
                      height: 15.0.hp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 0.0.wp,
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
                            width: 0.0.wp,
                          ),
                          SizedBox(
                            width: 60.0.wp,
                            //  240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Documents approval status",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.5.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Your Documents have been approved successfull and has been verified.You can activate your Doctor module by clicking\non the activate button given below..",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
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
                          SizedBox(
                            width: 10.0.wp,
                          )
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: Icon(
                          //       Icons.more_horiz,
                          //       color: Colors.grey,
                          //     )),
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
                    GestureDetector(
                      onTap: () {
                        Get.to(User_Profile(
                          id: '',
                          postId: '',
                        ));
                      },
                      child: SizedBox(
                        height: 12.0.hp,
                        //  80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 0.0.wp,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  ExactAssetImage("images/myprofilebg.jpg"),
                            ),
                            SizedBox(
                              width: 0.0.wp,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Nina ann",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.5.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Nina ann Requested to follow you",
                                  maxLines: 1,
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
                                          // follow_request_accecpt = false;
                                          follow_request_accecpt += 1;
                                          if (follow_request_accecpt == 1) {
                                            followrequest = "Accecpted";
                                          } else if (follow_request_accecpt ==
                                              2) {
                                            followrequest = "Follow";
                                          } else if (follow_request_accecpt ==
                                              3) {
                                            followrequest = "Following";
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 4.0.hp,
                                        // 31,
                                        width: 27.0.wp,
                                        //  100,
                                        alignment: Alignment.center,
                                        child: Text(
                                          followrequest,
                                          // follow_request_accecpt == false
                                          //     ? "Accecpted"
                                          //     : "Accept",
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
                                      visible: follow_request_accecpt >= 1
                                          ? false
                                          : true,
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
                            Visibility(
                                visible:
                                    follow_request_accecpt >= 1 ? true : false,
                                child: SizedBox(
                                  width: 30.0.wp,
                                )),
                            // Visibility(
                            //   visible: follow_request_accecpt,
                            //   child: IconButton(
                            //       onPressed: () {},
                            //       icon: Icon(
                            //         Icons.more_horiz,
                            //         color: Colors.grey,
                            //       )),
                            // )
                          ],
                        ),
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
}
