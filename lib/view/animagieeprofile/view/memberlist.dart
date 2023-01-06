import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/instancepage/controller/memberlist_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../userprofile/view/userprofile.dart';
// import '../../userprofile/userprofile.dart';

class Member_List_Content extends StatefulWidget {
  int index;
  String? myUserId;
  Member_List_Content({super.key, required this.index, required this.myUserId});

  @override
  State<Member_List_Content> createState() => _Member_List_ContentState();
}

class _Member_List_ContentState extends State<Member_List_Content> {
  MemberListController memberListController = Get.find();
  Controller dashboardController = Get.put(Controller());

  bool follow_req = true;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = memberListController.memberData.first.data![widget.index];
      return Card(
        child: Row(children: [
          Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: GestureDetector(
              onTap: () {
                if (data.userid.toString() == widget.myUserId) {
                  dashboardController.selectedIndex(4);
                  Get.off(() => Home_Page());
                } else {
                  Get.to(() => User_Profile(
                        id: data.userid!.toString(),
                      ));
                }
              },
              child: data.profileicon!.isEmpty
                  ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          ExactAssetImage("images/profile_icon.png"),
                    )
                  : CircleAvatar(
                      backgroundImage:
                          NetworkImage(data.profileicon.toString()),
                      //  ExactAssetImage(
                      // "images/pexels-chevanon-photography-1108099.jpg"),
                    ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (data.userid.toString() == widget.myUserId) {
                dashboardController.selectedIndex(4);
                Get.off(() => Home_Page());
              } else {
                Get.to(() => User_Profile(
                      id: data.userid!.toString(),
                    ));
              }
            },
            child: SizedBox(
              width: 50.0.wp,
              child: Padding(
                padding: EdgeInsets.all(2.0.sp),
                child: Text(
                  data.username.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          widget.myUserId.toString() == data.userid.toString()
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: GestureDetector(
                    onTap: () {
                      memberListController.followUnfollow(
                          userId: data.userid, index: widget.index);
                    },
                    child: Container(
                      height: 3.5.hp,
                      //  26,
                      width: 23.0.wp,
                      // 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: animagiee_CL,
                          borderRadius: BorderRadius.circular(5.0.sp)),
                      child: Obx(
                        () => Text(
                          memberListController.followStatus[widget.index],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
        ]),
      );
    });
  }
}
