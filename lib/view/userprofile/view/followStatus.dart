import 'dart:developer';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/userprofile/controller/other_user_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowStatus extends StatefulWidget {
  String? id;
  int ind;

  FollowStatus({this.id, required this.ind});
  @override
  State<FollowStatus> createState() => _FollowStatusState();
}

class _FollowStatusState extends State<FollowStatus> {
  UserPostProfileController controller = Get.put(UserPostProfileController());
  String userId = "";
  @override
  void initState() {
    fetchData();
    fetcProfile();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      controller.getFollowingUser(id: widget.id.toString());
      log("loogggg -->${controller.followingStatus.toString()}");
    });
  }

  fetcProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getString(Constant.userId)!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 41.5.wp, left: 45.0.wp),
      child: GestureDetector(
          onTap: () {
            controller.followingFollowUser(
              userId: widget.id,
            );
          },
          child: Container(
              height: 3.0.hp,
              // 26,
              width: 25.0.wp,
              // 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: animagiee_CL,
                  borderRadius: BorderRadius.circular(15.0.sp)),
              child: Obx(() => Text(
                    controller.followingStatus.value,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )))),
    );
  }
}
