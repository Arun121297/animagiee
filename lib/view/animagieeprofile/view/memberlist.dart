import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/memberlist_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../userprofile/view/userprofile.dart';
// import '../../userprofile/userprofile.dart';

class Member_List_Content extends StatefulWidget {
  int index;
  Member_List_Content({required this.index});

  @override
  State<Member_List_Content> createState() => _Member_List_ContentState();
}

class _Member_List_ContentState extends State<Member_List_Content> {
  MemberListController memberListController = Get.find();

  bool follow_req = true;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (memberListController.memberscreenloadingindicator.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (memberListController.memberData.isEmpty) {
        return const Center(child: Text("No result found"));
      } else {
        return Card(
          child: Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: GestureDetector(
                onTap: () {
                  Get.to(User_Profile(
                    postId: "",
                    id: '',
                  ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(memberListController
                      .memberData[0].data![widget.index].profileicon
                      .toString()),
                  //  ExactAssetImage(
                  // "images/pexels-chevanon-photography-1108099.jpg"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Text(memberListController
                  .memberData[0].data![widget.index].username
                  .toString()),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // follow_req == "Follow" ? "Request" : "Follow";
                    if (follow_req == false) {
                      follow_req = true;
                    } else if (follow_req == true) {
                      follow_req = false;
                    }
                  });
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
                  child: Text(
                    follow_req == false ? "Follow" : "Request",
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
            )
          ]),
        );
      }
    });
  }
}
