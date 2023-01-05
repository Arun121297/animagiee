import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../userprofile/view/userprofile.dart';
// import '../../userprofile/userprofile.dart';

class Member_List_Content extends StatefulWidget {
  const Member_List_Content({Key? key}) : super(key: key);

  @override
  State<Member_List_Content> createState() => _Member_List_ContentState();
}

class _Member_List_ContentState extends State<Member_List_Content> {
  bool follow_req = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: GestureDetector(
            onTap: () {
              Get.to(User_Profile(
                id: '',
              ));
            },
            child: const CircleAvatar(
              backgroundImage: ExactAssetImage(
                  "images/pexels-chevanon-photography-1108099.jpg"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Text(
            "Karthi",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 10.5.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
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
}
