import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../animagieeprofile/animalsprofiles.dart';
import '../../homeAppBar/appbar.dart';
import '../../homeAppBar/notification.dart';
import '../../homeAppBar/search.dart';
import '../../homepage/homepage.dart';
import '../communitypage.dart';
import 'createnewclub.dart';
import 'mysubscriptionlist.dart';

class MyClubs_UI extends StatefulWidget {
  const MyClubs_UI({Key? key}) : super(key: key);

  @override
  State<MyClubs_UI> createState() => _MyClubs_UIState();
}

class _MyClubs_UIState extends State<MyClubs_UI> {
  @override
  void initState() {
    controller.clubprofileimage = File("");
    controller.clubbackgroundimage = File("");
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
              controller.communitylist.isEmpty
                  ? Align(
                      heightFactor: 30,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("No Datas"),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height - 290,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.communitylist.length,
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
