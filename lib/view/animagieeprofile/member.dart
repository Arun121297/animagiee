import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../userprofile/userprofile.dart';

class Pageview2_Member extends StatefulWidget {
  const Pageview2_Member({Key? key}) : super(key: key);

  @override
  State<Pageview2_Member> createState() => _Pageview2_MemberState();
}

class _Pageview2_MemberState extends State<Pageview2_Member> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          child: Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: GestureDetector(
                onTap: () {
                  Get.to(User_Profile());
                },
                child: CircleAvatar(
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
                    fontSize: 10.0.sp,
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
                  "Follow",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
