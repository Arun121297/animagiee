import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../homepage/view/homepage.dart';

class Edit_Profile_AppBar_UI extends StatefulWidget {
  const Edit_Profile_AppBar_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_AppBar_UI> createState() => _Edit_Profile_AppBar_UIState();
}

class _Edit_Profile_AppBar_UIState extends State<Edit_Profile_AppBar_UI> {
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
              // color: Colors.black,
            ),
            onPressed: () {
              Get.to(Home_Page());
            },
          ),

          Expanded(child: Container()),
          // Expanded(child: SizedBox()),
          SizedBox(width: 13.0.wp
              //  45,
              ),
          Text(
            "Profile",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 11.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Container()),

          SizedBox(
            width: 24.0.wp,
            // 70,
          )
        ]),
      ),
    );
  }
}
