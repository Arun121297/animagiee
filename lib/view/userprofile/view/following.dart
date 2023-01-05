import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/otherUserFollowing.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Following_UI extends StatefulWidget {
  String id;
  Following_UI({required this.id});

  @override
  State<Following_UI> createState() => _Following_UIState();
}

class _Following_UIState extends State<Following_UI> {
  UserPostProfileController userPostProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
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
            Get.to(OtherUserFollowingView(id: widget.id));
          },
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0.sp),
              child: Text(
                "Following",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: animagiee_CL,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,

                  //  scrollDirection: Axis.vertical,
                  itemCount: userPostProfileController.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 8.0.sp),
                      child: Text(
                        userPostProfileController.data[0].followingUser
                            .toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ]),
        )));
  }
}
