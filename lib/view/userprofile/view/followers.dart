import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/otherUserFollow.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class FollowersUI extends StatefulWidget {
  String id;
  FollowersUI({required this.id});

  @override
  State<FollowersUI> createState() => _FollowersUIState();
}

class _FollowersUIState extends State<FollowersUI> {
  UserPostProfileController userPostProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 4.0.hp,
        // 30,
        width: 33.0.wp,
        // 124,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: animagiee_CL,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: GestureDetector(
          onTap: () {
            Get.to(() => OtherUserFollow(id: widget.id));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.sp),
                child: Text(
                  "Followers",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                color: animagiee_CL,
              ),
              Text(
                userPostProfileController.data.first.followerUser.toString(),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.0.sp,
                    color: dummycontent_Cl,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
