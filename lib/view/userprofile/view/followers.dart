import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/otherUserFollow.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Followers_UI extends StatefulWidget {
  String id;
  Followers_UI({required this.id});

  @override
  State<Followers_UI> createState() => _Followers_UIState();
}

class _Followers_UIState extends State<Followers_UI> {
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
            Get.to(OtherUserFollow(id: widget.id));
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
              VerticalDivider(
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
                          userPostProfileController.data[index].followerUser
                              .toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: dummycontent_Cl,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
