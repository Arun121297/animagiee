import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Doctor_Profile_Bg_Name_UI extends StatefulWidget {
  const Doctor_Profile_Bg_Name_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Profile_Bg_Name_UI> createState() =>
      _Doctor_Profile_Bg_Name_UIState();
}

class _Doctor_Profile_Bg_Name_UIState extends State<Doctor_Profile_Bg_Name_UI> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/doc_3.jpg"), fit: BoxFit.cover),
            // color: animagiee_CL,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0.sp),
                bottomRight: Radius.circular(15.0.sp))),
        width: MediaQuery.of(context).size.width,
        height: 13.0.hp,
        // 108,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0.sp),
                bottomRight: Radius.circular(15.0.sp))),
        width: MediaQuery.of(context).size.width,
        height: 13.0.hp,
        // 108,
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.0.sp, left: 20.0.sp),
        child: Align(
          heightFactor: 1.4,
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            radius: 42.0.sp,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: ExactAssetImage("images/doc_2.jpg"),
              radius: 40.0.sp,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(48.0.sp),
        child: Container(
            margin: EdgeInsets.only(left: 60.0.sp),
            child: Text(
              "David joseph",
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 20.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
      ),
    ]);
  }
}
