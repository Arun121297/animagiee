import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:animagieeui/view/communitypage/controller/createclubcontroller.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
// import 'package:animagieeui/view/bottombarfile/view/bottomnavibar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';
import '../../../animagieeprofile/view/animalsprofiles.dart';
import '../../../homeAppBar/view/appbar.dart';
import '../../../homeAppBar/view/notification.dart';
import '../../../homeAppBar/view/search.dart';
import '../../../homepage/view/homepage.dart';
import '../communitypage.dart';
import 'createnewclub.dart';
import 'mysubscriptionlist.dart';

class MyClubs_UI extends StatefulWidget {
  const MyClubs_UI({Key? key}) : super(key: key);

  @override
  State<MyClubs_UI> createState() => _MyClubs_UIState();
}

class _MyClubs_UIState extends State<MyClubs_UI> {
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  CreatedClubController createdClubController =
      Get.put(CreatedClubController());
  @override
  void initState() {
    controller.clubprofileimage = File("");
    controller.clubbackgroundimage = File("");
    createdClubController.clubcreatedcontroller();
    // TODO: implement initState
    super.initState();
  }

  back() async {
    await Get.to(Home_Page());
  }

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return back();
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarContainer(
                title: "My Clubs",
                backarrow: true,
                edit: false,
                chat: false,
                notification_back_arrow: false,
                notification: true,
                searchfunction: true,
                searchfunctionclose: false,
                firstscreen: false,
                navipage: null,
                search: true,
                logo: false,
                podcast: false,
                fun: Home_Page(),
              ),
              // controller.clubapp("My Clubs", Home_Page(), context),
              GestureDetector(
                onTap: () {
                  Get.to(Create_New_Club_UI());
                },
                child: Container(
                  height: 10.0.hp,
                  // 87,
                  // color: Colors.orange,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22.0.sp),
                        child: CircleAvatar(
                            child: IconButton(
                                icon: Icon(
                                  Icons.person_add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Get.to(Create_New_Club_UI());
                                }),
                            backgroundColor: animagiee_CL),
                      ),
                      SizedBox(width: 5.0.sp
                          // 22,
                          ),
                      Text(
                        "Create New Club",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 12.0.sp,
                            color: dummycontent_Cl,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Sub_Container_CL,
                height: 5.0.hp,
                //  35,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "   My Created Club",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

////
              ///Created Club
              Obx(() {
                if (createdClubController.clubcreatedloadingindicator.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (createdClubController.getcreateclubdata.isEmpty) {
                  return Center(
                    child: Text("No Club Created"),
                  );
                } else {
                  return SizedBox(
                    height: 20.0.hp,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            createdClubController.getcreateclubdata.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Get.to(Animals_Profiles_UI());
                                });
                              },
                              child: Card(
                                child: SizedBox(
                                  height: 7.0.hp,
                                  // 56,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 6.0.wp,
                                        //  16,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            createdClubController
                                                .getcreateclubdata[0]
                                                .data![index]
                                                .clubicon
                                                .toString()),
                                      ),
                                      SizedBox(width: 4.0.wp
                                          //  13,
                                          ),
                                      Text(createdClubController
                                          .getcreateclubdata[0]
                                          .data![index]
                                          .clubName
                                          .toString()),
                                      // Expanded(child: Container()),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     print(instanceContoroller.communitylist.length);
                                      //     setState(() {
                                      //       if (visibility == false) {
                                      //         visibility = true;
                                      //       } else {
                                      //         visibility = false;
                                      //       }
                                      //     });
                                      //   },
                                      //   child: Container(
                                      //     height: 3.5.hp,
                                      //     //  26,
                                      //     width: 24.0.wp,
                                      //     // 90,
                                      //     alignment: Alignment.center,
                                      //     decoration: BoxDecoration(
                                      //         color: animagiee_CL,
                                      //         borderRadius: BorderRadius.circular(5.0.sp)),
                                      //     child: Text(
                                      //       visibility == true ? "Joined" : "Request",
                                      //       style: GoogleFonts.poppins(
                                      //         textStyle: TextStyle(
                                      //           fontSize: 9.0.sp,
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.w500,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(width: 3.0.wp
                                          // 12,
                                          )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                          // Container(
                          //   child: Text(createdClubController
                          //       .getcreateclubdata[0].data![index].clubName
                          //       .toString()),
                          // );
                        }),
                  );
                }
                // Container();
              }),
              Container(
                color: Sub_Container_CL,
                height: 5.0.hp,
                //  35,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "   My Subscriptions",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              instanceContoroller.communitylist.isEmpty
                  ? Align(
                      heightFactor: 20,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("No Datas"),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                      height: 48.0.hp,
                      // MediaQuery.of(context).size.height / 2.1,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: instanceContoroller.communitylist.length,
                          itemBuilder: (context, index) => My_Sub_List_Content(
                                fetchindex: index,
                              )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
