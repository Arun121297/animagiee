import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class User_Profile_Name_UI extends StatefulWidget {
  const User_Profile_Name_UI({Key? key}) : super(key: key);

  @override
  State<User_Profile_Name_UI> createState() => _User_Profile_Name_UIState();
}

class _User_Profile_Name_UIState extends State<User_Profile_Name_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(55.0.sp),
      child: Container(
          margin: EdgeInsets.only(left: 50.0.sp),
          child: Text(
            "Karthi",
            style: GoogleFonts.jost(
              textStyle: TextStyle(
                fontSize: 19.0.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}
