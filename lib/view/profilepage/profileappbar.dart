import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homeAppBar/backbutton.dart';
import 'editprofilepage.dart';

class Profile_AppBar_UI extends StatefulWidget {
  var title;
  Profile_AppBar_UI({Key? key, this.title}) : super(key: key);

  @override
  State<Profile_AppBar_UI> createState() => _Profile_AppBar_UIState();
}

class _Profile_AppBar_UIState extends State<Profile_AppBar_UI> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 12.0.sp,
              color: Colors.black,
            ),
            onPressed: () {
              // Get.to(Home_Page());
            },
          ),

          Flexible(child: Container()),
          // Expanded(child: SizedBox()),
          SizedBox(
            width: 45,
          ),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 11.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(child: Container()),
          GestureDetector(
            onTap: () {
              Get.to(Edit_Profile_UI());
            },
            child: Container(
              height: 20,
              width: 70,
              decoration: BoxDecoration(
                  color: animagiee_CL, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Edit",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 9.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Image.asset(
                    "images/editicon.png",
                    cacheHeight: 14,
                    cacheWidth: 14,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )

          // Expanded(child: Container()),
          // Search_UI(),
          // Notification_UI(),
        ]),
      ),
    );
  }
}
